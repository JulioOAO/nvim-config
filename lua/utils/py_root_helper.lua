local M = {}

local project_roots = {}

---@param file string
---@return string|nil
function M.detect_root(file)
	if not file or file == "" then
		return nil
	end

	local bufnr = vim.api.nvim_get_current_buf()
	if project_roots[bufnr] then
		return project_roots[bufnr]
	end

	local found = vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, {
		upward = true,
		path = file,
		---@diagnostic disable-next-line:undefined-field
		stop = vim.loop.os_homedir(),
	})[1]

	if found then
		local root = vim.fs.dirname(found)
		project_roots[bufnr] = root
		return root
	end
	return nil
end

---@param file string
---@return string|nil
function M.detect_venv_python(file)
	local root = M.detect_root(file)
	if not root then
		return nil
	end

	local venv_names = { ".venv", "venv", "env" }

	-- La subcarpeta donde se encuentra el ejecutable de python varía según el SO
	local python_executable_path
	if vim.fn.has("win32") == 1 then
		python_executable_path = "Scripts/python.exe"
	else
		python_executable_path = "bin/python"
	end

	for _, venv_name in ipairs(venv_names) do
		local potential_python = table.concat({ root, venv_name, python_executable_path }, "/")
		-- vim.fn.filereadable() comprueba si el archivo existe y es legible
		if vim.fn.filereadable(potential_python) == 1 then
			return potential_python
		end
	end

	return nil
end

---@param file string
---@return string|nil
function M.detect_venv_pylsp(file)
	local root = M.detect_root(file)
	if not root then
		return nil
	end

	local venv_names = { ".venv", "venv", "env" }
	local pylsp_executable = "pylsp.exe"

	for _, venv_name in ipairs(venv_names) do
		-- Construye la ruta al ejecutable de pylsp
		local potential_pylsp = table.concat({ root, venv_name, "Scripts", pylsp_executable }, "/")
		if vim.fn.filereadable(potential_pylsp) == 1 then
			return potential_pylsp
		end
	end

	return nil
end
return M
