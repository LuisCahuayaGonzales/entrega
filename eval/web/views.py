from django.views import View
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from spa.models import Producto

# Create your views here.
class IndexView(View):
    template_name = 'index.html'

    def get(self, request):
        productos = Producto.objects.all()
        data = {
            'productos' : productos
        }
        return render(request, self.template_name, data)

class LoginView(View):
    template_name = 'login.html'

    def get(self, request):
        return render(request, self.template_name, {})
    
    def post(self, request):
        username = request.POST['user']
        password = request.POST['pass']
        user = authenticate(username=username,  password=password)
        if user is not None:
            login(request, user)
            return redirect('/home')
        else :
          data = {
            'error': True
          }
          return render(request, self.template_name, data)

class RegisterView(View):
    template_name = 'register.html'

    def get(self, request):
        return render(request, self.template_name, {})
    
    def post(self, request):
        name = request.POST['name']
        image = request.FILES['img']
        description = request.POST['desc']
        p = Producto(name=name,image=image,description=description)
        p.save()
        return redirect('/home')

class DetailView(View):
    template_name = 'detail.html'

    def get(self, request, id):
        product = Producto.objects.get(id=id)
        data = {
            'producto' : product
        }
        return render(request, self.template_name, data)

class LogoutView(View):
    '''
    Pagina de cierre de sesion
    '''

    def get(self, request):
        logout(request)
        return redirect('/')
