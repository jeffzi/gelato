local assert = require("luassert")
local say = require("say")

local M = {}

local function string_match(_, arguments)
   local s = arguments[1]
   local pattern = arguments[2]
   return s:find(pattern) ~= nil
end

assert:register(
   "assertion",
   "string_match",
   string_match,
   "assertion.string_match.positive",
   "assertion.string_match.negative"
)
say:set("assertion.string_match.positive", "Expected %s to match %s")
say:set("assertion.string_match.negative", "Expected %s to not match %s")

function M.require_uncached(module_name)
   package.loaded[module_name] = nil
   return require(module_name)
end

return M
