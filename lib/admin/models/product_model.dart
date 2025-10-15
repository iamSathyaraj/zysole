import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final String category;
  final int stock;
  // final String brand;
  final Color? color;
  final int? size;
  // bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    // required this.brand,
    this.color,
    this.size,
    // required this.isFavorite
  });

  factory Product.fromMap( Map<String, dynamic> data,String id,) {
    return Product(
      id: id, 
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] as num).toDouble(),
      imageUrl: data['imageUrl'] ?? '',
      category: data['category'] ?? '',
      stock: data['stock'] ?? 0,
      // brand: data['brand'] ?? '',
      color: data['color'] !=null?Color(data['color']):null,
      size: data['size'],
      // isFavorite: data['isFavorite']

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'stock': stock,
      // 'brand':brand,
      'color':color?.toARGB32(),  
      'size':size,
      // 'isFavorite':isFavorite
    };
  }


  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    int? stock,
    String? brand,
    Color? color,
    int? size,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      // brand: brand ?? this.brand,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

}
