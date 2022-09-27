require("@nomicfoundation/hardhat-toolbox")
require("@nomiclabs/hardhat-solhint")
require("hardhat-deploy")
require("dotenv").config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
    solidity: "0.8.17",
    defaultNetwork: "hardhat",
    networks: {
        goerli: {
            url: process.env.GOERLI_RPC_URL,
            accounts: [],
        },
    },
}
