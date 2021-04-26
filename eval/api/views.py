from django.shortcuts import render
from rest_framework import viewsets
from rest_framework import permissions

from api.serializers import ProductoSerializer
from spa.models import Producto
# Create your views here.
class ProductoViewSet(viewsets.ModelViewSet):
    queryset =  Producto.objects.all()
    serializer_class = ProductoSerializer
    # permission_classes = permissions.IsAuthenticated
