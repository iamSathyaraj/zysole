
import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/models/product_model.dart';
import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/controllers/cart_provider.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/user/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
   final String productId;
  const ProductDetailScreen({Key? key,
  required this.productId
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product?product;


  int selectedSize = 8;
  int selectedColor = 0;

  final List<int> sizes = [6, 7, 8, 9, 10, 11];
  final List<Color> colors = [
    Color(0xFFffb347), 
    Color(0xFFe75480),
    Color(0xFFffcc80)  
  ];

 
  final String mainImage = "https://i.imgur.com/6nK2MAl.png";
  final List<String> thumbImages = [
    "https://i.imgur.com/d6KcTMI.png",
    "https://i.imgur.com/d6KcTMI.png",
    "https://i.imgur.com/d6KcTMI.png",
  ];

void fetchProduct() async{
  final productProvider=Provider.of<ProductProvider>(context,listen: false);
   Product? fetchedProduct= await productProvider.getProductById(widget.productId);

   if(fetchedProduct!=null){
    setState(() {
      product=fetchedProduct;
    });
   }  
}

@override
  void initState() {
    super.initState();
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    if(product==null){
      return Scaffold(
       body: CircularProgressIndicator(),
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 248, 248),
        body: 
        
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // height: 400,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 120),
                      // Center(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(20),
                      //       color: Colors.grey[200],
                      //     ),
                      //     padding: EdgeInsets.all(16),
                      //     margin: EdgeInsets.only(top: 16, bottom: 16),
                      //     child: Image.network(
                      //       mainImage,
                      //       width: 220,
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children:[
                                 Container(
                                height: 130,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.amber
                                ),
                              ),
                              Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(0, 111, 192, 114)
                                ),
                                child: Image.asset("assets/images/nike_air_max.png",fit: BoxFit.contain,),
                              )
                              ]
                            ),
                          )
                        ],
                      ),
                     
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
        
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF22232A),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                child: Divider(
                        thickness: 3,
                        indent: 120,
                        endIndent: 120,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(product!.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Icon(Icons.star, color: Color(0xFFffb347), size: 18),
                        SizedBox(width: 2),
                        Text("4.8", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 16),
                        Icon(Icons.favorite_border, color: Colors.white),
                        SizedBox(width: 12),
                        Icon(Icons.bookmark_border, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      "men shoes",
                      style: TextStyle(color: Colors.grey[400], fontSize: 13),
                    ),
                    SizedBox(height: 18),
                    Text(product!.description,
                      style: TextStyle(color: Colors.grey[400], fontSize: 13),
                    ),
                    SizedBox(height: 24),
                    Text("Size :", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    Row(
                      children: sizes.map((sz) {
                        final selected = selectedSize == sz;
                        return GestureDetector(
                          onTap: () => setState(() => selectedSize = sz),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 42,
                            height: 42,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selected ? Colors.white : Color(0xFF353535),
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: selected
                                  ? [BoxShadow(color: Colors.black26, blurRadius: 6)]
                                  : [],
                            ),
                            child: Text(
                              sz.toString(),
                              style: TextStyle(
                                color: selected ? Colors.black : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Text("Colors :", style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    Row(
                      children: List.generate(colors.length, (i) {
                        final selected = selectedColor == i;
                        return GestureDetector(
                          onTap: () => setState(() => selectedColor = i),
                          child: Container(
                            margin: EdgeInsets.only(right: 16),
                            padding: EdgeInsets.all(selected ? 4 : 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: selected
                                  ? Border.all(color: Colors.white, width: 2)
                                  : null,
                            ),
                            child: CircleAvatar(
                              backgroundColor: colors[i],
                              radius: 12,
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price :",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              product!.price.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFFFF6B6B),
                            minimumSize: Size(170, 48),
                            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          onPressed: () async{
                            final authProvider = Provider.of<AuthProvider>(context, listen: false);
  final cartProvider = Provider.of<CartProvider>(context, listen: false);
  final currentUser = authProvider.user;

  if (currentUser == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please login to add items to cart")),
    );
    return;
  }

  final cartItem = CartItem(
    id: UniqueKey().toString(), 
    productId: product!.id,
    userId: currentUser.id,
    name: product!.name,
    price: product!.price,
    quantity: 1,
  );

  try {
    await cartProvider.addToCart(cartItem);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to add to cart: $e")),
    );
  }
},
                          child: Text("Add To Cart"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
