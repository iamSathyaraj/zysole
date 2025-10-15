import 'package:e_commerce/user/views/bottom_nav_menu.dart';
import 'package:e_commerce/user/views/order_placed_congrats_screen.dart';
import 'package:flutter/material.dart';

class custom_empty_cart_card extends StatelessWidget {
  const custom_empty_cart_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 221, 0)),
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
}