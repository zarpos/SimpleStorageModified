// function deployFunc() {
//     console.log("Probando")
// }

// module.exports.default = deployFunc

module.exports = async ({ getNamedAccounts, deployements }) => {
    const { deploy, log } = deployements
    const { deployer } = await getNamedAccounts()
}

// When we want to use a localhost or hardhat, we want to use a mock
