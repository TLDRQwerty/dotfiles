local android_sdk = vim.env.ANDROID_HOME or vim.env.ANDROID_SDK_ROOT

---@type vim.lsp.Config
return {
	-- Android support depends on importing the Gradle project, so do not start
	-- an isolated server for standalone Kotlin files.
	single_file_support = false,
	cmd_env = android_sdk and {
		ANDROID_HOME = android_sdk,
		ANDROID_SDK_ROOT = android_sdk,
	} or nil,
}
