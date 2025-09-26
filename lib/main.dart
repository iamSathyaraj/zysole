import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/controllers/product_provider.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:e_commerce/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> AuthProvider()),
      ChangeNotifierProvider(create: (context)=> ProductProvider())
    ],
    child: const MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      darkTheme: ThemeData(),
      home: SplashScreen(),
    );
  }
}



