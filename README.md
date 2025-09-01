# packer-gui
## What is packer-gui?
- packer-gui is literally just packer.nvim but with the lazy.nvim look

## What does packer-gui do?
- Makes packer look a lot more closer to lazy.nvim, which is just a floating buffer on the user's terminal

# Installation
1. Have packer.nvim installed
2. On your init.lua (or anything that you put plugins on), add this to your config
    ```lua
   use {
      'ImStyrene/packer-gui',
       config = function()
          require('packer-gui')
       end
   }
   ```
3. Save the file, then do `:so` to source the file or `:qa` to quit every single buffer, then enter neovim again
4. Run `:PackerSync`
5. Enjoy!

# How to activate packer-gui?
- `:Packer` on command mode, or make a custom remap for it
