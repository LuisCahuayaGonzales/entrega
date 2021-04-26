from django.db import models
from django.utils.translation import gettext

# Create your models here.
class Producto(models.Model):
    name = models.CharField(max_length=140)
    image = models.ImageField(gettext("Imagen"), upload_to='product', blank=True)
    description = models.CharField(max_length=140)
    created_on = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['created_on']
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'

    def __str__(self):
        return self.name
