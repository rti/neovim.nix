{ pkgs, ... }: {

  keymaps = [
    { mode = [ "n" "v" ]; key = "<localleader>n"; action = "<cmd>lua Snacks.picker.explorer({hidden=true})<cr><c-w>p<c-w>="; }

    { mode = [ "n" "v" ]; key = "<localleader>ff"; action = "<cmd>lua Snacks.picker.smart({title='Files',hidden=true})<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fg"; action = "<cmd>lua Snacks.picker.grep({hidden=true})<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fb"; action = "<cmd>lua Snacks.picker.recent()<cr>"; }
    { mode = [ "n" "v" ]; key = "<localleader>fn"; action = "<cmd>lua Snacks.picker.noice()<cr>"; }
  ];

  plugins.snacks = {
    enable = true;
    settings = {
      picker = {
        enabled = true;
      };

      input = {
        enabled = true;
      };
    };
  };

  extraPackages = with pkgs; [ ripgrep ];

  extraConfigLua = ''
    local function grep_in_selected_dir()
      Snacks.picker({
        finder = "proc",
        layout = {
          preset = "select", 
        },
        cmd = "fd",
        args = { "--type", "d", "--exclude", ".git", "--hidden" },
        title = "Grep in dir",
        actions = {
          confirm = function(picker, item)
            picker:close()
            vim.schedule(function()
              Snacks.picker.grep({ cwd = item.file, title = "Grep in " .. item.file, hidden = true })
            end)
          end,
        },
        transform = function(item)
          item.file = item.text
          item.dir = true
        end,
      })
    end

    vim.keymap.set("n", "<leader>fG", grep_in_selected_dir, { desc = "Grep in selected directory" })   
  '';
}
