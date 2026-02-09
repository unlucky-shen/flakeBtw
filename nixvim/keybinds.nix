{ config, nixvim, ... }:

{
	keymaps = [
		{
			mode = "n";
			key = "<leader>w";
			action = ":w<CR>";
			options = {
			silent = true;
			};
		}
		{
			mode = "n";
			key = "<leader>q";
			action = ":q<CR>";
			options = {
			silent = true;
			};
		}
		{
			mode = "n";
			key = "<leader>f";
			action = ":Pick files<CR>";
			options = {
			silent = true;
			};
		}
		{
			mode = "n";
			key = "<leader>h";
			action = ":Pick help<CR>";
			options = {
			silent = true;
			};
		}
		{
			mode = "n";
			key = "<leader>g";
			action = ":Pick grep_live<CR>";
			options = {
			silent = true;
			};
		}
		{
			mode = "n";
			key = "<leader>lf";
			action = "vim.lsp.buf.format";
			options = {
			silent = true;
			};
		}
	];
}
