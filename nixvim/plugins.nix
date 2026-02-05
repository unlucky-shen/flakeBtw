{ config, pkgs, lib, nixvim, ... }: 

{
	plugins.transparent = {
		enable = true;
		autoLoad = true;
	};
	plugins.web-devicons.enable = true;
	plugins.lualine.enable = true;
	plugins.mini-pick.enable = true;
	plugins.nvim-autopairs.enable = true;
	plugins.indent-blankline.enable = true;
	plugins.treesitter = {
		enable = true;
		settings = {
			auto_install = false;
			ensure_installed = [
				"r"
				"python"
				"lua"
				"rust"
				"c"
				"cpp"
				"typst"
			];
			highlight.enable = true;
		};
	};

	plugins.lsp = {
		enable = true;
		servers = {
			clangd.enable = true;
			tinymist.enable = true;
			pyright = {
				enable = true;
				settings.python.analysis.typeCheckingMode = "off";
			};
			rust_analyzer = {
				enable = true;
				package = null;
				installCargo = false;
				installRustc = false;
			};
			lua_ls = {
				enable = true;
				settings.Lua.diagnostic.disable = [ "missing-fields" ];
			};
			# r_language_server.enable = true;
		};

	};
}
