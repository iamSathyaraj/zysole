import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/views/product/admin_add_product.dart';
import 'package:e_commerce/user/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminProductListScreen extends StatefulWidget {
  @override
  _AdminProductListScreenState createState() => _AdminProductListScreenState();
}

class _AdminProductListScreenState extends State<AdminProductListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: productProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : productProvider.products.isEmpty
              ? Center(child: Text('No products available'))
              : ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(productId: product.id,
                          // product: product
                          )));
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          // leading: product.imageUrl.isNotEmpty
                              // ? ClipRRect(
                              //     borderRadius: BorderRadius.circular(8),
                              //     child: Image.network(
                              //       product.imageUrl,
                              //       width: 60,
                              //       height: 60,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   )
                              // : 
                              // Icon(Icons.image_not_supported, size: 60, color: Colors.grey),
                          title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}\nQuantity: ${product.stock}'),
                          isThreeLine: true,
                          trailing: Row(mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                            children:[ IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                              },
                            ),
                            IconButton(onPressed: (){

                            }, icon: Icon(Icons.delete))
                            ]
                          ),
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));
        },
      ),
    );
  }
}
// import 'package:e_commerce/controllers/product_provider.dart';
// import 'package:e_commerce/views/admin/admin_add_product.dart';
// import 'package:e_commerce/views/product_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AdminProductListScreen extends StatefulWidget {
//   @override
//   _AdminProductListScreenState createState() => _AdminProductListScreenState();
// }

// class _AdminProductListScreenState extends State<AdminProductListScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ProductProvider>(context, listen: false).fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Products')),
//       body: productProvider.isLoading
//           ? Center(child: CircularProgressIndicator())
//           : productProvider.products.isEmpty
//               ? Center(child: Text('No products available'))
//               : ListView.builder(
//                   itemCount: productProvider.products.length,
//                   itemBuilder: (context, index) {
//                     final product = productProvider.products[index];

//                     return GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(product: product)));
//                       },
//                       child: Card(
//                         margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: ListTile(
//                           // leading: product.imageUrl.isNotEmpty
//                               // ? ClipRRect(
//                               //     borderRadius: BorderRadius.circular(8),
//                               //     child: Image.network(
//                               //       product.imageUrl,
//                               //       width: 60,
//                               //       height: 60,
//                               //       fit: BoxFit.cover,
//                               //     ),
//                               //   )
//                               // : 
//                               // Icon(Icons.image_not_supported, size: 60, color: Colors.grey),
//                           title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
//                           subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}\nQuantity: ${product.stock}'),
//                           isThreeLine: true,
//                           trailing: Row(mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                             children:[ IconButton(
//                               icon: Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                               },
//                             ),
//                             IconButton(onPressed: (){

//                             }, icon: Icon(Icons.delete))
//                             ]
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProductScreen()));
//         },
//       ),
//     );
//   }
// }
