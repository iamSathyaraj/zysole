// import 'package:e_commerce/controllers/product_provider.dart';
// import 'package:e_commerce/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductFormScreen extends StatefulWidget {
//   final Product? product; 
//   const ProductFormScreen({super.key, this.product});

//   @override
//   State<ProductFormScreen> createState() => _ProductFormScreenState();
// }

// class _ProductFormScreenState extends State<ProductFormScreen> {
//   final _formKey = GlobalKey<FormState>();

//   late TextEditingController _nameController;
//   late TextEditingController _priceController;
//   late TextEditingController _categoryController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.product?.name ?? '');
//     _priceController = TextEditingController(text: widget.product?.price.toString() ?? '');
//     _categoryController = TextEditingController(text: widget.product?.category ?? '');
//   }

//   void _saveProduct() async {
//     if (!_formKey.currentState!.validate()) return;

//     final productProvider = Provider.of<ProductProvider>(context, listen: false);

//     final product = Product(
//       id: widget.product!.id,
//        name: widget.product!.name,
//         description: widget.product!.description,
//          price: widget.product!.price,
//           // imageUrl: widget.product!.imageUrl,
//            category: widget.product!.category,
//             stock: widget.product!.stock,
//             brand: widget.product!.brand,
//             color: widget.product!.color,
//             size: widget.product!.size,
//             // isFavorite: widget.product!.isFavorite
//             );
//     try {
//       if (widget.product == null) {
//         await productProvider.addSingleProduct(product);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Product added successfully")),
//         );
//       } else {
//         await productProvider.updatetheProduct(product, widget.product!.id);
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Product updated successfully")),
//         );
//       }
//       Navigator.pop(context); // Go back after save
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isEdit = widget.product != null;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isEdit ? "Edit Product" : "Add Product"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Consumer<ProductProvider>(
//           builder: (context, provider, child) {
//             return provider.isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: _nameController,
//                           decoration: const InputDecoration(labelText: "Product Name"),
//                           validator: (value) => value!.isEmpty ? "Enter product name" : null,
//                         ),
//                         TextFormField(
//                           controller: _priceController,
//                           decoration: const InputDecoration(labelText: "Price"),
//                           keyboardType: TextInputType.number,
//                           validator: (value) => value!.isEmpty ? "Enter product price" : null,
//                         ),
//                         TextFormField(
//                           controller: _categoryController,
//                           decoration: const InputDecoration(labelText: "Category"),
//                           validator: (value) => value!.isEmpty ? "Enter category" : null,
//                         ),
//                         const SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: _saveProduct,
//                           child: Text(isEdit ? "Update Product" : "Add Product"),
//                         ),
//                       ],
//                     ),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
