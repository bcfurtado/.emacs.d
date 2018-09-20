# .emacs.d

## install

```sh
$ mkdir ~/emacs
$ git clone --recurse-submodules git@github.com:bcfurtado/.emacs.d.git ~/emacs/emacs-bcfurtado
$ ln -s ~/emacs/emacs-bcfurtado ~/.emacs.d
```

## requirements

- emacs >= 25

### optional requirements
- ag
- ispell
- rg

### lsp requirements
```
pip install 'python-language-server[all]'
npm install -g javascript-typescript-langserver
npm install -g vue-language-server
```

## useful links
* [emacs flash card](https://gist.github.com/bcfurtado/898d74a4610213ac7c0c4dd9b06926ea)
* [emacs survival guide](https://gist.github.com/cribeiro/4a10cf13cd789bb17aa511c263b62a65)
* [working with multi emacs configurations](https://gist.github.com/bcfurtado/fb9b37c81b27ef2bc5c8899de5a66e9c)
