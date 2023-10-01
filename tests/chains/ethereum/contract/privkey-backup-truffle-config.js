const HDWalletProvider = require("@truffle/hdwallet-provider");
const PrivateKeyProvider = require("truffle-privatekey-provider");
const mnemonic =
  "math razor capable expose worth grape metal sunset metal sudden usage scheme";
const privateKey = '1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef';
module.exports = {
  networks: {
    chain0: {
      network_id: "*",
      provider: () =>
        new HDWalletProvider(
          privateKey,"http://127.0.0.1:8645"
        ),
    },
    chain1: {
      network_id: "*",
      provider: () =>
      new HDWalletProvider(
        privateKey,"http://127.0.0.1:8745"
      ),
    },
  },

  compilers: {
    solc: {
      version: "0.8.9",
      settings: {
        optimizer: {
          enabled: true,
          runs: 1000,
        },
      },
    },
  },
  plugins: ["truffle-contract-size"],
};
