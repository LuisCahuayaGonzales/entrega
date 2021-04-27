import 'dart:ffi';

import 'package:evalm/data/models/product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  Product product;
  DetailScreen({this.product});
  @override
  _DetailScreenState createState() => _DetailScreenState(product: product);
}

class _DetailScreenState extends State<DetailScreen> {
  Product product;
  _DetailScreenState({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Image.network(product.image, width: double.infinity,),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  product.name + ' - ' + product.id.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'description: ${product.description}',
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}