  import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:e_commerce/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
  // import 'package:flutter/material.dart';

  class ProductService{

  final FirebaseFirestore _firestores=FirebaseFirestore.instance;
  final CollectionReference _productCollection=FirebaseFirestore.instance.collection("products");

  


  Future<void> addProduct(Product product) async {
      try {
        await _productCollection.add(product.toMap());
              log("Product added successfully");
         } on FirebaseException catch (e) {
        log("Add product error: $e");
        throw Exception("Failed to add product: ${e.message}");
      }catch (e){
        log("error adding product$e");
        throw Exception("error adding product$e");
      }
    }

  Future<void>updateProduct(String productId, Product product)async{

      try{
      await _productCollection.doc(productId).update(product.toMap());
      log("product updated successfully");


  } on FirebaseException catch (e){
      log("update product error:");
      throw Exception("failed to update product:$e");
  } catch (e){
    log("error in update product$e");
    throw Exception("error in update product$e");
  } 
  }

  Future<void>deleteProduct(String productId)async{
      try{
          await _productCollection.doc(productId).delete();
          log("product deleted successfully");
      }on FirebaseException catch(e){
          log("delete product error");
          throw Exception("failed to delete product:$e");
      } catch (e){
          log("error in delete product : $e");
      throw Exception(" error in deleting product");
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
        }else{
          log("product not found");
          return null;
        }
      }on FirebaseException catch (e) {
        log("Get product error: $e");
        throw Exception("failed gto get Product$e");
      } catch (e){
        log("error in getting product$e");
        throw Exception("error in getting product$e");
      }
      // return null;
    }
  }
