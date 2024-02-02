if vim.g.neovide then
    vim.o.guifont = "CaskaydiaCove NF:h14,WenQuanYi Zen Hei:h14" -- text below applies for VimScript
 
    vim.g.neovide_remember_window_size = true

    vim.g.neovide_scale_factor = 0.9
    local change_scale_factor = function(delta)
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
      change_scale_factor(1.2)
    end)
    vim.keymap.set("n", "<C-->", function()
      change_scale_factor(1/1.2)
    end)
end
