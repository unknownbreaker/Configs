-- lua/overseer/template/nx/targets.lua
-- Dynamically exposes one Overseer template per Nx target (incl. per-configuration)
--
-- Requirements: Nx in your repo (nx.json), and ability to run one of:
--   pnpm nx / yarn nx / npx nx

local overseer = require("overseer")

local function project_root()
  return vim.fs.root(0, { "nx.json", "workspace.json", "project.json", "package.json" })
end

local function nx_runner(root)
  -- Pick a runner that fits your repo
  if vim.fn.filereadable(root .. "/pnpm-lock.yaml") == 1 then
    return { "pnpm", "nx" }
  elseif vim.fn.filereadable(root .. "/yarn.lock") == 1 then
    return { "yarn", "nx" }
  else
    -- fallback, works with npm too
    return { "npx", "nx" }
  end
end

local function read_json(cmd, cwd)
  local res = vim.system(cmd, { text = true, cwd = cwd }):wait()
  if res.code ~= 0 then
    return nil, res.stderr or ("command failed: " .. table.concat(cmd, " "))
  end
  local ok, data = pcall(vim.json.decode, res.stdout)
  if not ok then
    return nil, "failed to parse JSON"
  end
  return data, nil
end

-- Efficiently build a flat list of {project, target, config?}
local function collect_targets(root)
  local runner = nx_runner(root)

  -- 1) list all projects
  local projects, err = read_json(vim.list_extend(vim.deepcopy(runner), { "show", "projects", "--json" }), root)
  if not projects then
    return nil, "nx show projects --json failed: " .. (err or "")
  end

  local combos = {}
  for _, project in ipairs(projects) do
    -- 2) show targets for each project
    local info, perr = read_json(vim.list_extend(vim.deepcopy(runner), { "show", "project", project, "--json" }), root)
    if info and info.targets then
      for target, tdef in pairs(info.targets) do
        local has_configs = tdef.configurations and (vim.tbl_count(tdef.configurations) > 0)
        if has_configs then
          for config_name, _ in pairs(tdef.configurations) do
            table.insert(combos, { project = project, target = target, configuration = config_name })
          end
        else
          table.insert(combos, { project = project, target = target })
        end
      end
    else
      vim.schedule(function()
        vim.notify(("Nx: failed to read targets for %s: %s"):format(project, perr or ""), vim.log.levels.WARN)
      end)
    end
  end
  table.sort(combos, function(a, b)
    if a.project == b.project then
      if a.target == b.target then
        return (a.configuration or "") < (b.configuration or "")
      end
      return a.target < b.target
    end
    return a.project < b.project
  end)
  return combos
end

-- One Overseer “template generator” that yields a TaskSpec per target/config
overseer.register_template({
  name = "Nx Targets (auto)",
  priority = 60, -- higher than default so it shows up near the top
  desc = "Run any Nx target from your workspace (auto-discovered)",
  condition = {
    callback = function()
      return project_root() ~= nil
    end,
  },
  generator = function(_, cb)
    local root = project_root()
    if not root then
      return cb({})
    end
    vim.schedule(function()
      local items, err = collect_targets(root)
      if not items then
        vim.notify("Nx template discovery error: " .. err, vim.log.levels.ERROR)
        return cb({})
      end
      local runner = nx_runner(root)
      local specs = {}

      for _, c in ipairs(items) do
        local title = ("Nx: %s:%s%s"):format(c.project, c.target, c.configuration and (":" .. c.configuration) or "")

        table.insert(specs, {
          name = title,
          builder = function()
            local args = { runner[2], c.target, c.project }
            if c.configuration then
              table.insert(args, "--configuration")
              table.insert(args, c.configuration)
            end
            -- You can tack on common flags here:
            -- table.insert(args, "--skip-nx-cache")
            return {
              cmd = runner[1],
              args = args,
              cwd = root,
              components = {
                "default",
                -- "unique", -- uncomment to avoid duplicate running tasks
                -- { "on_output_quickfix", open = true }, -- example extra component
              },
            }
          end,
        })
      end

      cb(specs)
    end)
  end,
})
