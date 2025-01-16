import Web3 from "web3";
import contractABI from "./contractABI.json"; // Your contract's ABI

const web3 = new Web3(Web3.givenProvider || "https://bsc-dataseed.binance.org/");
const contractAddress = "0x8c1bF9bBE1Cd98608632E65f0267a666d53fFa72";

const contract = new web3.eth.Contract(contractABI, contractAddress);

export const getTokenBalance = async (address) => {
  try {
    return await contract.methods.balanceOf(address).call();
  } catch (error) {
    console.error("Error fetching balance:", error);
    throw error;
  }
};

export const transferTokens = async (sender, recipient, amount) => {
  try {
    const accounts = await web3.eth.getAccounts();
    return await contract.methods
      .transfer(recipient, amount)
      .send({ from: sender || accounts[0] });
  } catch (error) {
    console.error("Error transferring tokens:", error);
    throw error;
  }
};
