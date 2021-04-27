import 'dart:convert';

class Product {
  int id;
  String name;
  String image;
  String description;

  Product({
    this.id,
    this.name,
    this.image,
    this.description,
  });

  static Product fromJSON(String jsonProduct) {
    return Product.fromMap(json.decode(jsonProduct));
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
    );
  }

  String toJSON() {
    return json.encode(this.toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
      'description': this.description,
    };
  }
}