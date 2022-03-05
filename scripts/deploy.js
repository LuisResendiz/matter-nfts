const deploy = async () => {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contract with the account: ",deployer.address);
    const MNFT = await ethers.getContractFactory("MNFT");
    const deployed = await MNFT.deploy();
    console.log("MNFT is deployed at: ",deployed.address);
}


deploy()
.then(()=> process.exit(0))
.catch((error) => {
    console.log(error);
    process.exit(1);
});