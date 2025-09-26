import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{

final ProductService _productService =ProductService();

  List<Product>_products =[];

 List <Product> get products=>_products;

 bool _isLoading = false;

 bool get isLoading=>_isLoading;


 void fetchProducts(){
  _productService.getProducts().listen((productsList){
    _products =productsList;
    notifyListeners();
  });
 }


Future<void>addSingleProduct(Product product)async{
  _isLoading=true;
  notifyListeners();

  try{
    _productService.addProduct(product);
  }catch (e){
    print("error fetching in productts");
  }


//      Product? result= await _productService.addProduct(product);
 
//  if(result ! = null){

//  }

}


Future<void>updatetheProduct(Product product, String id)async{
  _isLoading=true;
  try{
    await _productService.updateProduct(id, product);
  }catch (e){
    print("error updating product");
  }

}

  Future<void> deleteProduct(String productId) async {
    _isLoading = true;
    notifyListeners();

try{
  await _productService.deleteProduct(productId);

}catch (e){
  print("error in deleting product");
}

    
    _isLoading = false;
    notifyListeners();
  }

  Future<Product?> getProductById(String id) async {
    try {
      return await _productService.getProduct(id);
    } catch (e) {
      print("Error getting product: $e");
      return null;
    }
  }

}