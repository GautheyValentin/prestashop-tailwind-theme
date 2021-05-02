module.exports = {
  extends: ["airbnb-typescript/base"],
  globals: {
    google: true,
    document: true,
    navigator: false,
    window: true,
    prestashop: true,
  },
  parserOptions: {
    project: './tsconfig.json',
 },
 ignorePatterns: ["*.js"],
};