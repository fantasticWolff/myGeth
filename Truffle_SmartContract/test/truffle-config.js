module.exports = {
  //rpc: {
    //host: "127.0.0.1",
    //port: 40000
  //},
  networks: {
    geth: {
      host: "140.113.216.70",
      port: 40000,
      network_id: "*", //4869
      from:"0x84b1cbe1cfd9081939bd4a8c68e5183559f0c89b",
      gasPrice: 20000000000,  // 20 gwei (in wei) (default: 100 gwei)
      gas: 8500000      //make sure this gas allocation isn't over 4M, which is the max
      // gas: 8500000,           // Gas sent with each transaction (default: ~6700000)
      
    }
  }
};
