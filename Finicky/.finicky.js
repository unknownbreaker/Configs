const isUrlDefenseRedirect = (string) => string.includes("urldefense.com");
const zoomMatch =
  (custom) =>
  ({ url }) => {
    const DOMAINS = ["zoomgov.com", "zoom.us"];
    const checkDomain = (domain) =>
      isUrlDefenseRedirect(url.host)
        ? url.pathname.includes(domain + custom)
        : url.host.includes(domain) && url.pathname.includes(custom);
    return DOMAINS.some(checkDomain);
  };

module.exports = {
  defaultBrowser: "Browserosaurus",
  handlers: [
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
      match: zoomMatch("/join"),
      browser: "us.zoom.xos",
    },
  ],
  rewrite: [
    {
      match: zoomMatch("/j/"),
      url: ({ url }) => {
        let pass = "";
        try {
          pass = url.search.match(/pwd=(\w*)/)[1];
        } catch {}
        const conf = url.pathname.match(/\/j\/(\d+)/)[1];

        if (isUrlDefenseRedirect(url.host)) {
          const pathname = url.pathname.replace(
            /(^\/v3\/__)https:\/\/(.+)\/j\/\d+/,
            "$1zoommtg://$2/join",
          );

          return {
            ...url,
            pathname,
            search: `confno=${conf}&${url.search}`,
          };
        }

        return {
          ...url,
          search: `confno=${conf}&pwd=${pass}`,
          pathname: "/join",
          protocol: "zoommtg",
        };
      },
    },
  ],
};
