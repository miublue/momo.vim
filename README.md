<h1 align="center">Momo</h1>
<p align="center">Minimalistic dark theme for vim.</p>
<img align="center" src="./img.png"/>
<p align="center">Original theme on the left, recolored on the right.</p>

## Install
Installation may vary depending on how you manage your plugins, for example, when using [vim-plug](https://github.com/junegunn/vim-plug), add
```
Plug 'miublue/momo.vim'
```
to your init file.

## Configuration
Put this on your _~/.vimrc_:

    colorscheme momo

Background color can be turned off (terminal must support transparency):

    let g:momo_transparent_background = 1

Comments can be turned italics:

    let g:momo_italic_comments = 1

All colors can be changed:
```Vim
" colors are [hex, ansi]
let g:momo_background_color = ["#000000", 0]
let g:momo_foreground_color = ["#eeeeee", 255]
let g:momo_highlight_color  = ["#87d7ff", 117]
let g:momo_comment_color    = ["#8a8a8a", 245]
" you may set all the ansi colors to zero if you are too lazy
" to find a good-looking 256-color replacement and are *100% sure*
" that you will only be using it with true color support.
```

## Notes

- Options should be set before setting colorscheme.
- Colors may look off if `termguicolors` is disabled.

