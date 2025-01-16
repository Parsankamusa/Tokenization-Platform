from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response
from .web3_utils import get_token_balance, transfer_tokens

@api_view(['GET'])
def token_balance(request, address):
    balance = get_token_balance(address)
    return Response(balance)

@api_view(['POST'])
def transfer(request):
    sender_private_key = request.data.get("sender_private_key")
    recipient = request.data.get("recipient")
    amount = request.data.get("amount")
    result = transfer_tokens(sender_private_key, recipient, amount)
    return Response(result)

