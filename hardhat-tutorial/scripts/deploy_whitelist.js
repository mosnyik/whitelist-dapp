const { ethers} = require ('hardhat');
async function main(){
    // 1. figure out what contract to deploy
    // achieve that using ContratcFactory
    const whitelistContract = await ethers.getContractFactory("Whitelist");
    
    // 2. deploy the contract
   const deployedWhitelistContract = await whitelistContract.deploy(10);

    // 3. complete deployment
    await deployedWhitelistContract.deployed();
    // 4. console.log the contract address
    console.log("Whitelist Contract Address:", deployedWhitelistContract.address)
}

main().then(()=> process.exit(0)).catch((error)=>{
    console.error(error);
    process.exit(1);
})

// Whitelist Contract Address: 0xD0f861728ec181AbA183993EF0E593Ea72076b6D 
