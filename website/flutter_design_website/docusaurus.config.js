// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'Flutter design',
  tagline: 'Supercharge your Flutter UX development',
  url: 'https://flutterdesign.io',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.png',
  organizationName: 'ShiroYacha', // Usually your GitHub org/user name.
  projectName: 'flutter_design', // Usually your repo name.
  plugins: ["docusaurus-plugin-sass"],

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          editUrl: 'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
        },
        theme: {
          customCss: require.resolve('./src/scss/main.scss'),
        },
        gtag: {
          trackingID: 'G-S8W5YK0FNP',
          anonymizeIP: true,
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'Flutter design',
        logo: {
          alt: 'Flutter design Logo',
          src: 'img/logo.png',
        },
        items: [
          {
            type: 'doc',
            docId: 'get_started',
            position: 'right',
            label: 'Docs',
          },
          {
            href: 'https://github.com/ShiroYacha/flutter_design/',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Docs',
            items: [
              {
                label: 'Getting started',
                to: '/docs/get_started',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Stack Overflow',
                href: 'https://stackoverflow.com/questions/tagged/flutterdesign',
              },
              {
                label: 'Discord',
                href: 'https://discord.gg/jqmBbSkKc3',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'GitHub',
                href: 'https://github.com/ShiroYacha/flutter_design/',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Flutter Design, Built with Docusaurus.`,
      },
      prism: {
        defaultLanguage: "dart",
        additionalLanguages: ["dart", "yaml"],
        theme: require("prism-react-renderer/themes/vsLight"),
        darkTheme: require("prism-react-renderer/themes/dracula"),
      },
    }),
};

module.exports = config;
