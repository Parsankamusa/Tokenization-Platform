from web3 import Web3
from django.conf import settings

web3 = Web3(Web3.HTTPProvider(settings.WEB3_PROVIDER))

contract_address = "YOUR_CONTRACT_ADDRESS"
contract_abi = [...]  # Your contract's ABI

contract = web3.eth.contract(address=contract_address, abi=contract_abi)

def get_token_balance(address):
    try:
        return contract.functions.balanceOf(address).call()
    except Exception as e:
        return {"error": str(e)}

def transfer_tokens(sender_private_key, recipient, amount):
    try:
        sender_address = web3.eth.account.privateKeyToAccount(sender_private_key).address
        nonce = web3.eth.getTransactionCount(sender_address)
        transaction = contract.functions.transfer(recipient, amount).buildTransaction({
            'nonce': nonce,
            'gas': 200000,
            'gasPrice': web3.toWei('10', 'gwei'),
        })
        signed_txn = web3.eth.account.signTransaction(transaction, private_key=sender_private_key)
        tx_hash = web3.eth.sendRawTransaction(signed_txn.rawTransaction)
        return {"tx_hash": web3.toHex(tx_hash)}
    except Exception as e:
        return {"error": str(e)}
