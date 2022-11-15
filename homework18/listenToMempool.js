


const ethers = require('ethers')
async function listen(){
    const provider = new ethers.providers.WebSocketProvider('wss://eth-mainnet.g.alchemy.com/v2/ptDM2tonizEGg_fggxen-ih-S1L4WbTq');
    provider.on("pending", async (tx)=>{
        console.log(tx);    

    })
}

listen();

