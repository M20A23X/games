module.exports = {
  extends: [
    "../../.eslintrc"
  ],
  parserOptions: {
    project: "tsconfig.json",
    tsconfigRootDir: __dirname
  },
  settings: {
    "import/resolver": {
      "node": {
        "extensions": [".ts"],
        "moduleDirectory": ["src", "node_modules"]
      }
    }
  }
};