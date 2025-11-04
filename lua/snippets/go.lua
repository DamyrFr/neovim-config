local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node

return {
  -- Main function
  s("main", {
    t({"package main", "", "import (", "\t\"fmt\"", ")", "", "func main() {", "\t"}), i(1, "// TODO"),
    t({"", "}"})
  }),

  -- Function with error return
  s("func", {
    t("func "), i(1, "name"), t("("), i(2, "params"), t(") "), i(3, "error"), t({" {", "\t"}), i(4, "// TODO"),
    t({"", "\treturn nil", "}"})
  }),

  -- Method
  s("meth", {
    t("func ("), i(1, "receiver"), t(" *"), i(2, "Type"), t(") "), i(3, "MethodName"), t("("), i(4, "params"), t(") "), i(5, "error"), t({" {", "\t"}), i(6, "// TODO"),
    t({"", "\treturn nil", "}"})
  }),

  -- Struct
  s("struct", {
    t("type "), i(1, "Name"), t({" struct {", "\t"}), i(2, "field"), t(" "), i(3, "string"),
    t({"", "}"})
  }),

  -- Interface
  s("interface", {
    t("type "), i(1, "Name"), t({" interface {", "\t"}), i(2, "Method"), t("("), i(3, "params"), t(") "), i(4, "error"),
    t({"", "}"})
  }),

  -- Error handling
  s("iferr", {
    t({"if err != nil {", "\treturn "}), i(1, "err"),
    t({"", "}"})
  }),

  -- Error wrap
  s("errwrap", {
    t({"if err != nil {", "\treturn fmt.Errorf(\""}), i(1, "context"), t(": %w\", err)"),
    t({"", "}"})
  }),

  -- For loop
  s("for", {
    t("for "), i(1, "i"), t(" := "), i(2, "0"), t("; "), f(function(args) return args[1][1] end, {1}), t(" < "), i(3, "n"), t("; "), f(function(args) return args[1][1] end, {1}), t({"++ {", "\t"}), i(4, "// TODO"),
    t({"", "}"})
  }),

  -- Range loop
  s("forr", {
    t("for "), i(1, "i"), t(", "), i(2, "v"), t(" := range "), i(3, "slice"), t({" {", "\t"}), i(4, "// TODO"),
    t({"", "}"})
  }),

  -- Switch statement
  s("switch", {
    t("switch "), i(1, "value"), t({" {", "case "}), i(2, "condition"), t({":", "\t"}), i(3, "// TODO"),
    t({"", "default:", "\t"}), i(4, "// TODO"),
    t({"", "}"})
  }),

  -- Goroutine
  s("go", {
    t("go func() {"), t({"", "\t"}), i(1, "// TODO"),
    t({"", "}()"})
  }),

  -- Defer
  s("defer", {
    t("defer "), i(1, "function"), t("("), i(2), t(")")
  }),

  -- Test function
  s("test", {
    t("func Test"), i(1, "Name"), t({"(t *testing.T) {", "\t"}), i(2, "// TODO"),
    t({"", "}"})
  }),

  -- Table driven test
  s("testt", {
    t({"func Test"}), i(1, "Name"), t({"(t *testing.T) {", "\ttests := []struct {", "\t\tname string", "\t\t"}), i(2, "input"), t(" "), i(3, "string"),
    t({"", "\t\twant "}), i(4, "string"),
    t({"", "\t}{", "\t\t{name: \""}), i(5, "test case"), t("\", "), f(function(args) return args[1][1] end, {2}), t(": \""), i(6, "input"), t("\", want: \""), i(7, "expected"), t({"\"},", "\t}", "", "\tfor _, tt := range tests {", "\t\tt.Run(tt.name, func(t *testing.T) {", "\t\t\t"}), i(8, "// TODO"),
    t({"", "\t\t})", "\t}", "}"})
  }),

  -- Benchmark function
  s("bench", {
    t("func Benchmark"), i(1, "Name"), t({"(b *testing.B) {", "\tfor i := 0; i < b.N; i++ {", "\t\t"}), i(2, "// TODO"),
    t({"", "\t}", "}"})
  }),

  -- HTTP handler
  s("handler", {
    t("func "), i(1, "handlerName"), t({"(w http.ResponseWriter, r *http.Request) {", "\t"}), i(2, "// TODO"),
    t({"", "}"})
  }),

  -- JSON struct tags
  s("json", {
    t("`json:\""), i(1, "field_name"), t("\"`")
  }),

  -- Context with cancel
  s("ctx", {
    t("ctx, cancel := context.WithTimeout(context.Background(), "), i(1, "5*time.Second"), t({")","defer cancel()"})
  }),

  -- Make slice
  s("makes", {
    t("make([]"), i(1, "type"), t(", "), i(2, "0"), t(", "), i(3, "10"), t(")")
  }),

  -- Make map
  s("makem", {
    t("make(map["), i(1, "keyType"), t("]"), i(2, "valueType"), t(")")
  }),

  -- Print formatted
  s("printf", {
    t("fmt.Printf(\""), i(1, "format %v\\n"), t("\", "), i(2, "value"), t(")")
  }),

  -- Log error
  s("logerr", {
    t("log.Printf(\"error: %v\", "), i(1, "err"), t(")")
  }),
}
