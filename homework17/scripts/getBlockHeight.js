const {ethers} = require("hardhat")

//npx hardhat node --fork https://ethmainnet.alchemyapi.io/v2/ptDM2tonizEGg_fggxen-ih-S1L4WbTq

async function getBlockHeight(){
    const latestBlock = (await ethers.provider.getBlock("latest")).number
    console.log(latestBlock);
}

getBlockHeight()
    .then(()=> process.exit(0))
    .catch((error)=>{
        console.error(error);
        process.exit(1)
    })

