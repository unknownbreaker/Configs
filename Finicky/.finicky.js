module.exports = {
  handlers: [
    // Browserosaurus
    {
      match: () => finicky.getKeys().option,
      browser: "Browserosaurus",
    },

    // Chrome
    {
      match: ({ url }) =>
        /localhost|flightaware|rtx|collins|globalbeacon/.test(url.host) &&
        !/zoom|teams/.test(url.host),
      browser: "Google Chrome",
    },

    // Figma
    {
      match: ["https://www.figma.com/file/*", "https://www.figma.com/design/*"],
      browser: "Figma",
    },

    // Firefox
    {
      match: ["https://www.reddit.com/*"],
      browser: "Firefox",
    },

    // Microsft Teams
    {
      match: finicky.matchHostnames(["gov.teams.microsoft.us"]),
      browser: "Microsoft Teams classic",
    },

    // Zoom
    {
      match: finicky.matchHostnames([
        "flightaware.zoom.us",
        "collins.zoomgov.com",
        "www.zoomgov.com",
      ]),
      browser: "us.zoom.xos",
    },
  ],
  rewrite: [
    {
      match: ({ urlString, url }) =>
        /flightaware\.zoom\.us|collins\.zoomgov\.com/.test(urlString) &&
        url.pathname.includes("/j/"),
      url({ url }) {
        let pass = "";
        try {
          pass = url.search.match(/pwd=(\w*)/)[1];
        } catch {}
        const conf = url.pathname.match(/\/j\/(\d+)/)[1];

        if (url.host.includes("urldefense.com")) {
          const pathname = url.pathname.replace(
            /(^\/v3\/__)https:\/\/(.+)\/j\/\d+/,
            "$1zoommtg://$2/join",
          );

          return {
            pathname,
            search: `confno=${conf}&${url.search}`,
          };
        }

        return {
          search: `confno=${conf}&pwd=${pass}`,
          pathname: "/join",
          protocol: "zoommtg",
        };
      },
    },
  ],
};
