import 'package:e_commerce/views/cart_screen.dart';
import 'package:e_commerce/views/favourite_screen.dart';
import 'package:e_commerce/views/home_screen.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:e_commerce/views/product_detail_screen.dart';
import 'package:e_commerce/views/sign%20up/verify_email_screen.dart';
import 'package:e_commerce/views/sign%20up/signup_screen.dart';
import 'package:flutter/material.dart';

class BottomNavMenu extends StatefulWidget {
  const BottomNavMenu({super.key});

  @override
  State<BottomNavMenu> createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {
  int _selectedIndex=0;
  final List <Widget> _pages=[
    HomeScreen(),
    // LoginScreen(),
    CartScreen(),
    FavouriteScreenUI(),

    // VerifyEmailScreen(),
     ProductDetailScreen()
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
         setState(() {
          _selectedIndex=index;
         }
        );  
        },
         destinations: const[
           NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
           NavigationDestination(icon: Icon(Icons.shop), label: 'shop'),
           NavigationDestination(icon: Icon(Icons.luggage), label: 'Cart'),
           NavigationDestination(icon: Icon(Icons.person), label: 'profile')
        ]
        ),
    );
  }
}