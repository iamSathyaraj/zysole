import 'package:e_commerce/admin/controllers/admin_user_provider.dart';
import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/controllers/cart_provider.dart';
import 'package:e_commerce/controllers/favorite_provider.dart';
import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/user/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
        ChangeNotifierProvider(create: (_)=>UserProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      darkTheme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
