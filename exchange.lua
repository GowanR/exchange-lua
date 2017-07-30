--------------------------------------------------------------------------
-- `exchange.lua` finds how much your money's worth in other currencies --
-- uses http://www.fixer.io/ api                                        --
--                                                                      --
-- Written by GowanR                                                    --
--------------------------------------------------------------------------

local http = require("socket.http")
local json = require("json")

local help_text = [[

--help    -h		prints help menu
--options -o		prints exchange options

usage:
lua exchange.lua <ammount> <current type> <new type>
lua exchange.lua 23 USD EUR
]]

local options = [[
AUD
BGN
BRL
CAD
CHF
CNY
CZK
DKK
GBP
HKD
HRK
HUF
IDR
ILS
INR
JPY
KRW
MXN
MYR
NOK
NZD
PHP
PLN
RON
RUB
SEK
SGD
THB
TRY
ZAR
EUR
]]
assert(arg[1], help_text)
if arg[1] == "-h" or arg[1] == "--help" then
  print(help_text)
  return
end
if arg[1] == "-o" or arg[1] == "--options" then 
  print(options)
  return
end
local value = tonumber(arg[1])
assert(value, "Please provide a numerical value first.")
assert(arg[2], "Please provide current value type.")
assert(arg[3], "Please provide value to convert to.")

local base = arg[2]
local conversion = arg[3]

function get_exchange(base, conversion)
  r, e = http.request("http://api.fixer.io/latest?symbols=" .. conversion .. "&base=".. base)
  assert(e == 200, "Bad http request: " .. e)
  t = json.decode(r)
  assert(not t["error"], "Error occured: " .. (t["error"] or "unknown."))
  return t
end


function convert(base, value, coversion)
  local rates = get_exchange(base, conversion)
  assert(rates["rates"][conversion], "Conversion type not recognized.")
  return tonumber(rates["rates"][conversion]) * value or error("Unknown error!")
end
print(convert(base, value, conversion))
