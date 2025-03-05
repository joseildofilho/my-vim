# Jojo's Vim

It my NVim config, i've been working on it for a long time, and to be far, still tons way of been ideal, even for me, but that's ok the job will be going on.

## Instalation
It's rather simple, just clone the repo into yours ~/.config, with the folder named nvim. So after this when you start the nvim, the Lazy will kick in and download everything for you.

## TO-DO
- [ ] find a way to ensure that some programs will be installed into the OS, to avoid some plugins to break, like terraform or copilot.
- [ ] find a good plugin to connect to postgres
- [ ] can neotest running test into the side bar be animated ? I Mean, that little 2 arrows, can they be animated ?
- [x] how to make zt and zb dont go all the way and left some 2 lines of space ?
    It's possible by setting scrolloff to some extends of lines that you want to keep.
    ```lua
    vim.wo.scrolloff = 2
    ```
    Or
    ```VimScript
    set scrolloff = 2
    ```

