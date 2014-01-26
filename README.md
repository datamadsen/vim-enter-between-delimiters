vim-enter-between-delimiters
============================

A vim plugin that, based on the cursors surroundings, can open a line between
the delimiters that the plugin has been configured with.

For instance:

```javascript
function hello(param) {|}
```

becomes:

```javascript
function hello(param) {
    |
}
```

when you press enter.

The plugin has the following default delimiters baked in:

```vim
["{}", "[]", "()"]
```

You can change the delimiters like so:

```vim
let g:vebdDelimiters = ["{}", "[]", "()", "**"]
```

Add the following in you `.vimrc` to get it working for all file types:

```vim
inoremap <CR> <C-R>=vebd#vimEnterBetweenDelimiters()<CR>
```

or alternatively, for only some filetypes:

```vim
autocmd FileType javascript,css inoremap <CR> <C-R>=vedb#vimEnterBetweenDelimiters()<CR>
```
