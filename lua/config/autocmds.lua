-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function insert_header()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%:t")
  local date = os.date("%Y")

  local headers = {
    lua = {
      "--[===[",
      "-- Nom du fichier    : " .. filename,
      "-- Auteur            : Votre Nom",
      "-- Date de création  : " .. date,
      "-- Description       : ",
      "--]===]",
      "",
    },
    python = {
      '"""',
      "Nom du fichier    : " .. filename,
      "Auteur            : Votre Nom",
      "Date de création  : " .. date,
      "Description       : ",
      '"""',
      "",
    },
    c = {
      "/*",
      "** EPITECH PROJECT, " .. date,
      "** Project Name",
      "** File description:",
      "**",
      "*/",
      "",
    },
  }

  local header = headers[filetype] or headers["c"]

  vim.api.nvim_buf_set_lines(0, 0, 0, false, header)
end

vim.api.nvim_create_user_command("InsertHeader", insert_header, {})
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*", -- Appliquer à tous les types de fichiers (remplacez "*" par un motif spécifique si nécessaire)
  callback = function()
    vim.cmd("InsertHeader") -- Appelle la commande personnalisée pour insérer un en-tête
  end,
})
