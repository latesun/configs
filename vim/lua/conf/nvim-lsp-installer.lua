local lsp_installer_servers = require("nvim-lsp-installer.servers")
local servers = {
	-- 语言服务器名称：配置选项
	sumneko_lua = require("lsp.sumneko_lua"),
	gopls = require("lsp.common"),
	golangci_lint_ls = require("lsp.common"),
	-- zeta_note = require("lsp.zeta_note"),
	-- sqls = require("lsp.sqls"),
	rust_analyzer = {},
	yamlls = require("lsp.common"),
}

-- 这里是 LSP 服务启动后的按键加载
-- 目前 rust-tool 对接 telescope-ui-select 还没有调通
local function attach(_, bufnr)
	-- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
	keymap.b(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", keymap.opts)
	-- 跳转实现
	keymap.b(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations theme=dropdown<CR>", keymap.opts)
	-- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
	keymap.b(bufnr, "n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", keymap.opts)
	-- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
	keymap.b(bufnr, "n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", keymap.opts)
	-- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
	keymap.b(bufnr, "n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", keymap.opts)
	-- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
	keymap.b(bufnr, "n", "<leader>cn", "<cmd>Lspsaga rename<CR>", keymap.opts)
	-- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
	keymap.b(bufnr, "n", "gh", "<cmd>Lspsaga hover_doc<CR>", keymap.opts)
	-- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
	keymap.b(bufnr, "n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", keymap.opts)
	-- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
	keymap.b(bufnr, "n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", keymap.opts)
	-- 悬浮窗口上翻页，由 Lspsaga 提供
	keymap.b(bufnr, "n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", keymap.opts)
	-- 悬浮窗口下翻页，由 Lspsaga 提供
	keymap.b(bufnr, "n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", keymap.opts)
end

-- 自动安装或启动 LanguageServers
for server_name, server_options in pairs(servers) do
	local server_available, server = lsp_installer_servers.get_server(server_name)
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	-- 代替内置 omnifunc
	-- server_options.capabilities = capabilities
	-- 判断服务是否可用
	if server_available then
		-- 判断服务是否准备就绪，若就绪则启动服务
		server:on_ready(function()
			-- keybind
			server_options.on_attach = attach
			-- options config
			server_options.flags = {
				debounce_text_changes = 150,
			}
			-- 启动服务
			server:setup(server_options)
		end)
		-- 如果服务器没有下载，则通过 notify 插件弹出下载提示
		if not server:is_installed() then
			vim.notify("Install Language Server : " .. server_name, "WARN", { title = "Language Servers" })
			server:install()
		end
	end
	-- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验
end

-- require("lsp.rust_analyzer")
