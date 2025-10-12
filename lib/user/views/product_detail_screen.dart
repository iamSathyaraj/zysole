// import 'package:e_commerce/admin/controllers/product_provider.dart';
// import 'package:e_commerce/admin/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductDetailScreen extends StatefulWidget {
//    final String productId;
//   const ProductDetailScreen({Key? key,
//   required this.productId
//   });

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   Product?product;


//   int selectedSize = 8;
//   int selectedColor = 0;

//   final List<int> sizes = [6, 7, 8, 9, 10, 11];
//   final List<Color> colors = [
//     Color(0xFFffb347), 
//     Color(0xFFe75480),
//     Color(0xFFffcc80)  
//   ];

 
//   final String mainImage = "https://i.imgur.com/6nK2MAl.png";
//   final List<String> thumbImages = [
//     "https://i.imgur.com/d6KcTMI.png",
//     "https://i.imgur.com/d6KcTMI.png",
//     "https://i.imgur.com/d6KcTMI.png",
//   ];

// void fetchProduct() async{
//   final productProvider=Provider.of<ProductProvider>(context,listen: false);
//    Product? fetchedProduct= await productProvider.getProductById(widget.productId);

//    if(fetchedProduct!=null){
//     setState(() {
//       product=fetchedProduct;
//     });
//    }  
// }

// @override
//   void initState() {
//     super.initState();
//     fetchProduct();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if(product==null){
//       return Scaffold(
//        body: CircularProgressIndicator(),
//       );
//     }
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 249, 248, 248),
//       body: 
      
//       Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Container(
//                 // height: 400,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 120),
//                     // Center(
//                     //   child: Container(
//                     //     decoration: BoxDecoration(
//                     //       borderRadius: BorderRadius.circular(20),
//                     //       color: Colors.grey[200],
//                     //     ),
//                     //     padding: EdgeInsets.all(16),
//                     //     margin: EdgeInsets.only(top: 16, bottom: 16),
//                     //     child: Image.network(
//                     //       mainImage,
//                     //       width: 220,
//                     //       fit: BoxFit.contain,
//                     //     ),
//                     //   ),
//                     // ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Center(
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children:[
//                                Container(
//                               height: 130,
//                               width: 300,
//                               decoration: BoxDecoration(
//                                 color: Colors.amber
//                               ),
//                             ),
//                             Container(
//                               height: 200,
//                               width: 300,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(0, 111, 192, 114)
//                               ),
//                               child: Image.asset("assets/images/nike_air_max.png",fit: BoxFit.contain,),
//                             )
//                             ]
//                           ),
//                         )
//                       ],
//                     ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.center,
//                     //   children: [
//                     //     ...thumbImages.map((img) => Container(
//                     //       margin: EdgeInsets.symmetric(horizontal: 8),
//                     //       decoration: BoxDecoration(
//                     //         color: Colors.white,
//                     //         borderRadius: BorderRadius.circular(10),
//                     //         boxShadow: [
//                     //           BoxShadow(
//                     //             color: Colors.grey[300]!,
//                     //             blurRadius: 4,
//                     //             offset: Offset(0, 2),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //       child: Image.network(img, height: 48, width: 70, fit: BoxFit.contain),
//                     //     )),
//                     //   ],
//                     // ),
//                     SizedBox(height: 8),
//                   ],
//                 ),
//               ),
//             ),
//           ),
      
//           SingleChildScrollView(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFF22232A),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//               child: Divider(
//                       thickness: 3,
//                       indent: 120,
//                       endIndent: 120,
//                     ),
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(product!.name,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 22,
//                           ),
//                         ),
//                       ),
//                       Icon(Icons.star, color: Color(0xFFffb347), size: 18),
//                       SizedBox(width: 2),
//                       Text("4.8", style: TextStyle(color: Colors.white)),
//                       SizedBox(width: 16),
//                       Icon(Icons.favorite_border, color: Colors.white),
//                       SizedBox(width: 12),
//                       Icon(Icons.bookmark_border, color: Colors.white),
//                     ],
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "men shoes",
//                     style: TextStyle(color: Colors.grey[400], fontSize: 13),
//                   ),
//                   SizedBox(height: 18),
//                   Text(product!.description,
//                     style: TextStyle(color: Colors.grey[400], fontSize: 13),
//                   ),
//                   SizedBox(height: 24),
//                   Text("Size :", style: TextStyle(color: Colors.white)),
//                   SizedBox(height: 10),
//                   Row(
//                     children: sizes.map((sz) {
//                       final selected = selectedSize == sz;
//                       return GestureDetector(
//                         onTap: () => setState(() => selectedSize = sz),
//                         child: Container(
//                           margin: EdgeInsets.only(right: 10),
//                           width: 42,
//                           height: 42,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: selected ? Colors.white : Color(0xFF353535),
//                             borderRadius: BorderRadius.circular(14),
//                             boxShadow: selected
//                                 ? [BoxShadow(color: Colors.black26, blurRadius: 6)]
//                                 : [],
//                           ),
//                           child: Text(
//                             sz.toString(),
//                             style: TextStyle(
//                               color: selected ? Colors.black : Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(height: 10),
//                   Text("Colors :", style: TextStyle(color: Colors.white)),
//                   SizedBox(height: 10),
//                   Row(
//                     children: List.generate(colors.length, (i) {
//                       final selected = selectedColor == i;
//                       return GestureDetector(
//                         onTap: () => setState(() => selectedColor = i),
//                         child: Container(
//                           margin: EdgeInsets.only(right: 16),
//                           padding: EdgeInsets.all(selected ? 4 : 0),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: selected
//                                 ? Border.all(color: Colors.white, width: 2)
//                                 : null,
//                           ),
//                           child: CircleAvatar(
//                             backgroundColor: colors[i],
//                             radius: 12,
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                   SizedBox(height: 18),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Price :",
//                             style: TextStyle(color: Colors.white, fontSize: 15),
//                           ),
//                           Text(
//                             product!.price.toString(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 22,
//                             ),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: Color(0xFFFF6B6B),
//                           minimumSize: Size(170, 48),
//                           textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//                         ),
//                         onPressed: () {},
//                         child: Text("Add To Cart"),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  const ProductDetailScreen({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? product;
  int selectedSize = 8;
  int selectedColorIndex = 0;

  final List<int> sizes = [6, 7, 8, 9, 10, 11];
  final List<Color> colors = [
    Color(0xFFffb347),
    Color(0xFFe75480),
    Color(0xFFffcc80)
  ];

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  void fetchProduct() async {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    Product? fetchedProduct = await productProvider.getProductById(widget.productId);
    if (fetchedProduct != null) {
      setState(() {
        product = fetchedProduct;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return const Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 248, 248),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F9),
      body: SafeArea(
        child: Column(
          children: [
            // Top - Product Image Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 1,
                    offset: const Offset(0, 12),
                  )
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Shoe image
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 34),
                    // child: product!.imageUrl == null || product!.imageUrl.isEmpty
                        child:  Image.asset(
                            "assets/images/nike_air_max.png",
                            height: 140,
                            fit: BoxFit.contain,
                          )
                        // : Image.network(
                        //     product!.imageUrl,
                        //     height: 140,
                        //     fit: BoxFit.contain,
                        //   ),
                  ),
                  // Favorite icon (top right)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 11,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.favorite_border, color: Colors.redAccent, size: 26),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Details Card
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 26, left: 22, right: 22),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x11555555),
                      blurRadius: 30,
                      offset: Offset(0, -16),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name & Rating
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product!.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(Icons.star, color: Color(0xFFffb347), size: 18),
                          const SizedBox(width: 4),
                          const Text("4.8", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text("Men's Shoes",
                        style: TextStyle(
                          color: Colors.deepPurple.shade200,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product!.description,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 22),
                      // Sizes
                      const Text("Available Sizes:", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: sizes.map((sz) {
                          final selected = selectedSize == sz;
                          return GestureDetector(
                            onTap: () => setState(() => selectedSize = sz),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 38,
                              height: 38,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selected ? Colors.deepPurple : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: selected
                                    ? [const BoxShadow(color: Colors.black12, blurRadius: 4)]
                                    : [],
                              ),
                              child: Text(
                                sz.toString(),
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 18),
                      // Colors
                      const Text("Available Colors:", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 9),
                      Row(
                        children: List.generate(colors.length, (i) {
                          final selected = selectedColorIndex == i;
                          return GestureDetector(
                            onTap: () => setState(() => selectedColorIndex = i),
                            child: Container(
                              margin: const EdgeInsets.only(right: 14),
                              padding: EdgeInsets.all(selected ? 3 : 0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: selected ? Border.all(color: Colors.deepPurple, width: 2.2) : null,
                              ),
                              child: CircleAvatar(
                                backgroundColor: colors[i],
                                radius: 12,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      // Price & Add to Cart
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Price\n",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: "\$${product!.price}",
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                            label: const Text("Add To Cart", style: TextStyle(fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              minimumSize: const Size(150, 48),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              textStyle: const TextStyle(fontSize: 18),
                              elevation: 10,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
