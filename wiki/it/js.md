
    sudo npm install -g serve
    serve -s build                     # serve a build directory
    
    
## Setup VSCode
* https://marko-knoebl.github.io/slides/vs-code-collection-en.html
* Editor/Tab size: 2
* Accept Suggestions on Commit Characters: deactivate
* Auto Save: afterDelay
* Format on Save
* Merge Editor (3 way merge(
* Word Wrap (on, 80)
* plugins
    * prettier
    * liveserver
    * eslint
        * `npm install -g eslint `
        * `npx eslint --init`
        * ~/.eslintrc.js
```js
module.exports = {
    "env": {
        "es2021": true,
        "node": true
    },
    "extends": "eslint:recommended",
    "overrides": [
    ],
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module"
    },
    "rules": {
    }
}
```
