import 'package:evalm/data/models/product.dart';
import 'package:evalm/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService
{
  String url = '$API_URL/api/productos/';
  Future<List<Product>> listar() async {
    List<Product> lista;
    var response = await http.get(this.url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // la respuesta es una lista
      var mapList = json.decode(utf8.decode(response.bodyBytes));
      lista = mapList.map<Product>((item) => Product.fromMap(item)).toList();
    }
    return lista;
  }
}