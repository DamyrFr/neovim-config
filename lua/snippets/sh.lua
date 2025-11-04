local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- Bash shebang with error handling
  s("bash", {
    t({"#!/bin/bash", "", "set -euo pipefail", "", ""}), i(1, "# TODO")
  }),

  -- Function
  s("func", {
    i(1, "function_name"), t({"() {", "\t"}), i(2, "# TODO"),
    t({"", "}"})
  }),

  -- If statement
  s("if", {
    t("if [[ "), i(1, "condition"), t({" ]]; then", "\t"}), i(2, "# TODO"),
    t({"", "fi"})
  }),

  -- If-else statement
  s("ife", {
    t("if [[ "), i(1, "condition"), t({" ]]; then", "\t"}), i(2, "# TODO"),
    t({"", "else", "\t"}), i(3, "# TODO"),
    t({"", "fi"})
  }),

  -- If-elif-else statement
  s("ifel", {
    t("if [[ "), i(1, "condition1"), t({" ]]; then", "\t"}), i(2, "# TODO"),
    t({"", "elif [[ "}), i(3, "condition2"), t({" ]]; then", "\t"}), i(4, "# TODO"),
    t({"", "else", "\t"}), i(5, "# TODO"),
    t({"", "fi"})
  }),

  -- For loop
  s("for", {
    t("for "), i(1, "i"), t(" in "), i(2, "{1..10}"), t({"; do", "\t"}), i(3, "# TODO"),
    t({"", "done"})
  }),

  -- For loop over files
  s("forf", {
    t("for "), i(1, "file"), t(" in "), i(2, "*.txt"), t({"; do", "\t"}), i(3, "# TODO"),
    t({"", "done"})
  }),

  -- While loop
  s("while", {
    t("while [[ "), i(1, "condition"), t({" ]]; do", "\t"}), i(2, "# TODO"),
    t({"", "done"})
  }),

  -- Case statement
  s("case", {
    t("case \"$"), i(1, "variable"), t({"\" in", "\t"}), i(2, "pattern1"), t({")", "\t\t"}), i(3, "# TODO"),
    t({"", "\t\t;;", "\t"}), i(4, "pattern2"), t({")", "\t\t"}), i(5, "# TODO"),
    t({"", "\t\t;;", "\t*)", "\t\t"}), i(6, "# default"),
    t({"", "\t\t;;", "esac"})
  }),

  -- Check if file exists
  s("iff", {
    t("if [[ -f \""), i(1, "filename"), t({"\" ]]; then", "\t"}), i(2, "# file exists"),
    t({"", "fi"})
  }),

  -- Check if directory exists
  s("ifd", {
    t("if [[ -d \""), i(1, "dirname"), t({"\" ]]; then", "\t"}), i(2, "# directory exists"),
    t({"", "fi"})
  }),

  -- Check if variable is empty
  s("ifz", {
    t("if [[ -z \"$"), i(1, "variable"), t({"\" ]]; then", "\t"}), i(2, "# variable is empty"),
    t({"", "fi"})
  }),

  -- Check if variable is not empty
  s("ifn", {
    t("if [[ -n \"$"), i(1, "variable"), t({"\" ]]; then", "\t"}), i(2, "# variable is not empty"),
    t({"", "fi"})
  }),

  -- Array declaration
  s("array", {
    i(1, "array_name"), t("=("), i(2, "\"item1\" \"item2\" \"item3\""), t(")")
  }),

  -- Loop through array
  s("fora", {
    t("for "), i(1, "item"), t(" in \"${"), i(2, "array"), t({"[@]}\"; do", "\t"}), i(3, "# TODO"),
    t({"", "done"})
  }),

  -- Read file line by line
  s("readfile", {
    t("while IFS= read -r "), i(1, "line"), t("; do"),
    t({"", "\t"}), i(2, "# TODO"),
    t({"", "done < \""}), i(3, "filename"), t("\"")
  }),

  -- Command substitution
  s("cmd", {
    i(1, "variable"), t("=$("), i(2, "command"), t(")")
  }),

  -- Error handling
  s("err", {
    i(1, "command"), t({" || {", "\techo \"Error: "}), i(2, "message"), t({"\" >&2", "\texit 1", "}"})
  }),

  -- Usage function
  s("usage", {
    t({"usage() {", "\tcat <<EOF", "Usage: $(basename \"$0\") [OPTIONS]", "", ""}), i(1, "Description"),
    t({"", "", "OPTIONS:", ""}), i(2, "  -h, --help    Show this help message"),
    t({"", "EOF", "\texit 1", "}"})
  }),

  -- Parse arguments
  s("args", {
    t({"while [[ $# -gt 0 ]]; do", "\tcase $1 in", "\t\t"}), i(1, "-h|--help"), t({")", "\t\t\t"}), i(2, "usage"),
    t({"", "\t\t\t;;", "\t\t*)", "\t\t\techo \"Unknown option: $1\"", "\t\t\tusage", "\t\t\t;;", "\tesac", "\tshift", "done"})
  }),

  -- Check command exists
  s("cmd_exists", {
    t("if ! command -v "), i(1, "command"), t({" &> /dev/null; then", "\techo \""}), f(function(args) return args[1][1] end, {1}), t({" is not installed\" >&2", "\texit 1", "fi"})
  }),

  -- Trap for cleanup
  s("trap", {
    t({"cleanup() {", "\t"}), i(1, "# cleanup code"),
    t({"", "}", "", "trap cleanup EXIT"})
  }),

  -- Color output
  s("color", {
    t({"RED='\\033[0;31m'", "GREEN='\\033[0;32m'", "YELLOW='\\033[1;33m'", "NC='\\033[0m' # No Color", ""})
  }),

  -- Log function
  s("log", {
    t({"log() {", "\techo \"[$(date +'%Y-%m-%d %H:%M:%S')] $*\"", "}"})
  }),

  -- Error log function
  s("error", {
    t({"error() {", "\techo \"[ERROR] $*\" >&2", "}"})
  }),

  -- Die function
  s("die", {
    t({"die() {", "\techo \"[ERROR] $*\" >&2", "\texit 1", "}"})
  }),

  -- Get script directory
  s("scriptdir", {
    t("SCRIPT_DIR=\"$(cd \"$(dirname \"${BASH_SOURCE[0]}\")\" && pwd)\"")
  }),

  -- Temporary file
  s("tmpfile", {
    i(1, "tmpfile"), t("=$(mktemp)"),
    t({"", "trap 'rm -f \"$"}), f(function(args) return args[1][1] end, {1}), t({"\"' EXIT"})
  }),

  -- Here document
  s("heredoc", {
    t("cat <<'EOF'"), t({"", ""}), i(1, "content"),
    t({"", "EOF"})
  }),
}
