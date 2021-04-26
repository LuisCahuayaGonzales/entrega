from rest_framework import serializers
from spa.models import Producto

class ProductoSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model=Producto
        fields=['id','name','image','description']