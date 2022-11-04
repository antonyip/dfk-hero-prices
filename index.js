// axios
const axios = require("axios");

// dotenv
require('dotenv').config()
console.log(process.env)

// express server
const express = require("express");
const app = express();
const port = 3000;

// web3 client
const DFK_ENDPOINT = "https://avax-dfk.gateway.pokt.network/v1/lb/6244818c00b9f0003ad1b619//ext/bc/q2aTwKuyzgs8pynF7UXBZCU7DejbZbZ6EUyHr3JQzYgwNPUPi/rpc";
const Eth = require('web3-eth');
const eth = new Eth(DFK_ENDPOINT);

// postgres client
const { Client } = require('pg')
const pgClient = new Client({
  user: process.env.PGUSER,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
  host: process.env.PGHOST,
})
pgClient.connect()

// server functions
app.get("/", (req, res) => {
  res.send("Hello World! -- ");
});

app.get("/trigger", (req, res) => {
  res.send("trigger endpoint");
  //eth.getBlockNumber().then(console.log);
  eth.getPastLogs({
    fromBlock:9379000,
    toBlock:"latest",
    address: "0xc390faa4c7f66e4d62e59c231d5bed32ff77bef0",
    topics:["0xe40da2ed231723b222a7ba7da994c3afc3f83a51da76262083e38841e2da0982"]
  }).then(console.log).then(()=>{
    pgClient.query('SELECT $1::text as message', ['Hello world!'])
    .then((res) => {
      console.log(res.rows[0].message) 
    });
  });

});

// start server
const server = app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

// onClose
process.on('SIGTERM', () => {
  console.info('SIGTERM signal received.');
  server.close((err) => {
    pgClient.end()
    console.log('server closed')
    process.exit(err ? 1 : 0)
  })
});
