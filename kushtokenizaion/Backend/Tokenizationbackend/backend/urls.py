from django.urls import path
from . import views

urlpatterns = [
    path('api/token_balance/<str:address>/', views.token_balance, name='token_balance'),
    path('api/transfer/', views.transfer, name='transfer'),
]
