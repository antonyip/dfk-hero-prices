#!/bin/bash

curl https://avax-dfk.gateway.pokt.network/v1/lb/6244818c00b9f0003ad1b619//ext/bc/q2aTwKuyzgs8pynF7UXBZCU7DejbZbZ6EUyHr3JQzYgwNPUPi/rpc \
-H "Content-Type: application/json" \
-X POST --data '
{ 
  "jsonrpc":"2.0",
  "method":"eth_blockNumber",
  "params":[],
  "id":42 
}
'
