# showdown.vim

A Vim plugin for the [showdown][github-showdown] live markdown previewer.

## Installation

First, make sure you have [showdown][github-showdown-install] installed.

Then, install this plugin using your preferred method. I recommend using [vim-plug][github-vim-plug],
so it's as simple as adding
```vim
Plug 'cluttrdev/vim-showdown'
```
to your `~/.vimrc` and running `:PlugInstall` inside vim.

## Usage

You can use the following commands to start/stop/toggle the preview.

```vim
:ShowdownStart
:ShowdownStop
:ShowdownToggle
```

[github-showdown]: https://github.com/cluttrdev/showdown
[github-showdown-install]: https://github.com/cluttrdev/showdown#installation
[github-vim-plug]: https://github.com/junegunn/vim-plug
