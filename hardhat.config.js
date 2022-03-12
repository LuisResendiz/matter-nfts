require("@nomiclabs/hardhat-waffle");
const fs = require('fs');
const privateKey= fs.readFileSync(".secret").toString()
projectUrl="46bccc7d1b3df51fdb3a1b772f34c2c3a450b2de"

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks:{
  hardhat:{
    chainId:1337
  },
  mumbai:{
    url: 'https://rpc-mumbai.maticvigil.com/v1/46bccc7d1b3df51fdb3a1b772f34c2c3a450b2de',
    chainId:80001,
    accounts: [privateKey]
  },
  mainnet:{
    url: 'https://rpc-mainnet.maticvigil.com/v1/${projectUrl}',
    accounts: [privateKey]
  }
},
  solidity: "0.8.4",

};
