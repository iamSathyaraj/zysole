import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product_model.dart';
// import 'package:flutter/material.dart';

class ProductService{

final FirebaseFirestore _firestores=FirebaseFirestore.instance;
final CollectionReference _productCollection=FirebaseFirestore.instance.collection("products");

// final String _collection = "products";

 Future<void> addProduct(Product product) async {
    try {
      await _productCollection.add(product.toMap());
      // debugPrint("Product added successfully");
            print("Product added successfully");


    } on FirebaseException catch (e) {
      print("Add product error: $e");
      throw Exception("Failed to add product: ${e.message}");
    }
  }

Future<void>updateProduct(String productId, Product product)async{

    try{
    await _productCollection.doc(productId).update(product.toMap());


} on FirebaseException catch (e){
    print("update product error:");
    throw Exception("failed to update product:${e}");
}
}

Future<void>deleteProduct(String productId)async{
    try{
         await _productCollection.doc(productId).delete();
    }on FirebaseException catch(e){
        print("delete product error");
        throw Exception("failed to delete product${e}");
    }

}
  Stream<List<Product>> getProducts() {
    return _productCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) =>
              Product.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Future<Product?> getProduct(String productId) async {
    try {
      DocumentSnapshot doc = await _productCollection.doc(productId).get();
      if (doc.exists) {
        return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
    }on FirebaseException catch (e) {
      print("Get product error: $e");
      throw Exception("failed gto get Product${e}");
    }
    return null;
}

}