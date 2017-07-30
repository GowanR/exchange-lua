# exchange-lua
A small lua script for checking exchange rates. Uses [fixer.io](http://fixer.io/) api. Written for fun.

## Install
Use the intall.sh script for linux. Must have [luarocks](https://luarocks.org/).
`sh install.sh`

## Usage Example

Lets say I have $5 USD and I want to see how many Euros its worth. 

`lua exchange.lua 5 USD EUR`

on Sunday, 30. July 2017 12:15PM, the script prints,

`4.26295`

This is the basic idea.
`lua exchange.lua <ammout> <original exchange> <new exchange>`

Currency types supported:
*
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
*