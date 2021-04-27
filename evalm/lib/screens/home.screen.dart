import 'package:evalm/bloc/main.bloc.dart';
import 'package:evalm/data/models/product.dart';
import 'package:evalm/data/services/product.service.dart';
import 'package:evalm/provider/main.provider.dart';
import 'package:evalm/screens/detail.screen.dart';
import 'package:evalm/widget/user.widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  @override
  
  Widget build(BuildContext context) {
    MainBloc bloc = MainProvider.of(context);
    if (products.length == 0) {
      getproductos();
    }
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: [
            UserIconHeader()
          ],
        ),
        body: Container(
          child: GridView.count(
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            crossAxisCount: 2,
            padding: EdgeInsets.all(5),
            children: this.products.length != 0 ? products.map((e) => _product(e)).toList() :
[Container(margin: EdgeInsets.symmetric(horizontal: 188),child: CircularProgressIndicator()),],
          ),
        ),
      ),
    );
  }
  Widget _product(Product product)
  {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailScreen(product: product,)
          )
        );
      },
      child: Container(
        child: Stack(
          children: [
            Image.network(product.image),
            Positioned(
              right: 15,
              left: 15,
              top: 20,
              child: Card(
                child: Column(
                  children: [
                    Text(product.name),
                    Text(product.description),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void getproductos() async
  {
    ProductService service = ProductService();
    List<Product> list = await service.listar();
    setState(() {
      this.products = list;
    });
  }
}