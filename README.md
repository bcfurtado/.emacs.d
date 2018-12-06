# .emacs.d

## install

```sh
$ mkdir ~/emacs
$ git clone --recurse-submodules git@github.com:bcfurtado/.emacs.d.git ~/emacs/emacs-bcfurtado
$ ln -s ~/emacs/emacs-bcfurtado ~/.emacs.d
```

## requirements

- emacs >= 26

### installing
```
$ brew install emacs --with-cocoa --with-librsvg
```

### optional requirements
- ag
- ispell
- rg
- multimarkdown

### lsp requirements
```
pip install 'python-language-server[all]'
npm install -g javascript-typescript-langserver
npm install -g vscode-css-languageserver-bin
```


## useful links
* [emacs flash card](https://gist.github.com/bcfurtado/898d74a4610213ac7c0c4dd9b06926ea)
* [emacs survival guide](https://gist.github.com/cribeiro/4a10cf13cd789bb17aa511c263b62a65)
* [working with multi emacs configurations](https://gist.github.com/bcfurtado/fb9b37c81b27ef2bc5c8899de5a66e9c)


## found an issue?
open an issue with the stacktrace provived by emacs on debug mode.
```
$ emacs --debug-init
```
