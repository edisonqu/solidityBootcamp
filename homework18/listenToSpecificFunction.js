
const ethers = require("ethers")

const provider = new ethers.providers.WebSocketProvider('wss://eth-mainnet.g.alchemy.com/v2/ptDM2tonizEGg_fggxen-ih-S1L4WbTq');

filter = {
    address: "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2",
    topics: [
        ethers.utils.id("Approval(address,address,uint256)")
    ]
}
provider.on(filter, (log, event) => {
    // Emitted whenever a DAI token transfer occurs
    for(i = 0; i<8;i++){
        console.log("——————————————————————————————————————————————————————————");
        console.log("——————————————————————————————————————————————————————————");
        console.log("——————————————————————————————————————————————————————————");
        console.log("——————————————————————————————————————————————————————————");
        console.log("——————————————————————————————————————————————————————————");
    }
    console.log("Uniswap");
    console.log(log);
    console.log(event);
})