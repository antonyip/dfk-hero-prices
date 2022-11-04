#!/bin/bash

### Addresses
#HeroAuction: 0xc390fAA4C7f66E4D62E59C231D5beD32Ff77BEf0
#DFKHero: 0xEb9B61B145D6489Be575D3603F4a704810e143dF

# Sale
#Block: 9372402
#https://subnets.avax.network/defi-kingdoms/tx/0xab248df712cf83afc4efaea30e6a7a4900a874944ae3a5ea9066aaebc3049e38?tab=logs

# Event
#AuctionSuccessful(uint256,uint256,uint256,address)
#0xe40da2ed231723b222a7ba7da994c3afc3f83a51da76262083e38841e2da0982


curl https://avax-dfk.gateway.pokt.network/v1/lb/6244818c00b9f0003ad1b619//ext/bc/q2aTwKuyzgs8pynF7UXBZCU7DejbZbZ6EUyHr3JQzYgwNPUPi/rpc \
-H "Content-Type: application/json" \
-X POST --data '
{ 
  "jsonrpc":"2.0",
  "method":"eth_getLogs",
  "params": [
    {
      "fromBlock": "0x8EF000",
      "toBlock": "latest",
      "address": "0xc390faa4c7f66e4d62e59c231d5bed32ff77bef0",
      "topics": [
        "0xe40da2ed231723b222a7ba7da994c3afc3f83a51da76262083e38841e2da0982"
      ]
    }
  ],
  "id":42 
}
'

#topics[0] = AuctionSuccessful
#topics[1] = HeroID in Hex

# data0 000000000000000000000000000000000000000000000000000009184e79928a -- auction id
# data1 00000000000000000000000000000000000000000000001158e460913d000000 -- total price
# data2 000000000000000000000000902991a17bde453303e27e55fc06a2d643e5cf61 -- winner