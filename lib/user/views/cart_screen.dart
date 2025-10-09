
import 'package:e_commerce/controllers/cart_provider.dart';
import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/user/views/bottom_nav_menu.dart';
import 'package:e_commerce/user/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key,});
    final List<String>cartItems=[];


  @override
  Widget build(BuildContext context) {
    final cartProvider=Provider.of<CartProvider>(context,listen: false);
    final user= FirebaseAuth.instance.currentUser;
    if(user !=null){
        cartProvider.loadCart(user.uid);

    }
    return Scaffold(
      backgroundColor: const Color(0xFFE7F1FF), // light bluish background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (cart.cartItems.isEmpty) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 300,
                      child: Image.asset(
                        "assets/images/empty_cart.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "It’s empty here!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "You don’t have any items in your cart.",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavMenu()));  
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Continue Shopping",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.cartItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      CartItem item = cart.cartItems[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              color: Colors.yellow,
                            ),
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(12),
                            //   child: item.imageUrl != null
                            //       ? Image.network(
                            //           item.imageUrl!,
                            //           height: 90,
                            //           width: 90,
                            //           fit: BoxFit.contain,
                            //         )
                            //       : Image.asset(
                            //           "assets/images/nike_air_max.png",
                            //           height: 90,
                            //           width: 90,
                            //           fit: BoxFit.contain,
                            //         ),
                            // ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "\$${item.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      quantityButton(Icons.remove, () {
                                        if (item.quantity > 1) {
                                          cart.addToCart(CartItem(
                                            id: item.id,
                                            productId: item.productId,
                                            userId: item.userId,
                                            name: item.name,
                                            // imageUrl: item.imageUrl,
                                            price: item.price,
                                            quantity: -1, // decrement
                                            color: item.color,
                                            size: item.size,
                                          ));
                                        } else {
                                          cart.removeFromCart(item.id);
                                        }
                                      }),
                                      const SizedBox(width: 8),
                                      Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 8),
                                      quantityButton(Icons.add, () {
                                        cart.addToCart(CartItem(
                                          id: item.id,
                                          productId: item.productId,
                                          userId: item.userId,
                                          name: item.name,
                                          // imageUrl: item.imageUrl,
                                          price: item.price,
                                          quantity: 1,
                                          color: item.color,
                                          size: item.size,
                                        ));
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.orange),
                              onPressed: () => cart.removeFromCart(item.id),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Order Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Subtotal"),
                          Text("\$$cart.totalPrice.toStringAsFixed(2)}"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Tax"),
                          Text("\$0"), 
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$$cart.totalPric.toStringAsFixed(2)",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            
                          },
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  Widget quantityButton(IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, size: 18),
        onPressed: onTap,
      ),
    );
  }

}
