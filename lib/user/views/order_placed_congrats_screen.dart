import 'package:e_commerce/user/views/bottom_nav_menu.dart';
import 'package:e_commerce/user/views/home_screen.dart';
import 'package:e_commerce/user/views/users_list.dart';
import 'package:flutter/material.dart';

class OrderPlacedCongratsScreen extends StatefulWidget {
  const OrderPlacedCongratsScreen({super.key});

  @override
  State<OrderPlacedCongratsScreen> createState() =>
      _OrderPlacedCongratsScreenState();
}

class _OrderPlacedCongratsScreenState
    extends State<OrderPlacedCongratsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.8, 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              const Icon(Icons.check_circle,
                  color: Colors.green, size: 80), 
              const SizedBox(height: 15),
              const Text(
                "Congratulations!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your purchase was successful 🎉",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(
                "Order ID: #JHFDWPIEUFHWPEFJH",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavMenu())); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Continue Shopping",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
