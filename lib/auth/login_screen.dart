  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/controllers/auth_provider.dart';
  import 'package:e_commerce/core/constants/colors.dart';
  import 'package:e_commerce/core/constants/text_strings.dart';
  import 'package:e_commerce/admin/views/admin_drawer.dart';
import 'package:e_commerce/user/views/bottom_nav_menu.dart';
  import 'package:e_commerce/user/views/home_screen.dart';
  import 'package:e_commerce/auth/sign%20up/signup_screen.dart';
  import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
  import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
  import 'package:provider/provider.dart';

  class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> { 
    bool isLoading=false;

    bool _rememberMe=false;
    bool _obscurePassword = true;

    final _formKey=GlobalKey<FormState>();

    TextEditingController emaiController =TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Future<void> _login() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      isLoading=true;
    });
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await authProvider.loginUser(
        emaiController.text.trim(),
        passwordController.text.trim(),
      );
      setState(() {
        isLoading=false;
      });

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        isLoading=false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed: No user found")),
        );
        return;
      }

      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User record not found")),
        );
        return;
      }

      final userData = userDoc.data()!;
      final role = userData['role'] ?? 'user';

      if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AdminDashboard()),
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const BottomNavMenu()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed: ${e.toString()}")),
      );
    }
  }
}
        @override
  void dispose() {
    emaiController.dispose();
    passwordController.dispose();
    
    super.dispose();
  }

      @override
    Widget build(BuildContext context) {
      final authProvider = Provider.of<AuthProvider>(context);

       return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.shopping_bag,
                      size: 80, color: Colors.deepPurple),
                  const SizedBox(height: 20),
                  Text(
                    "Shop Smarter",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),
                  Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emaiController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email required";
                        }
                        final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText:  TextConstants.email,
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.deepPurple),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: const Color(0xFFB39DDB)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: const Color(0xFF673AB7), width: 2),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: TextConstants.password,
                        prefixIcon:
                            const Icon(Icons.lock, color: Colors.deepPurple),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.deepPurple,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.deepPurple.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.deepPurple, width: 2),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              activeColor: Colors.deepPurple,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                            ),
                            // const Text(TextConstants.rememberMe),
                          ],
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const Text(
                        //     TextConstants.forgetPassword,
                        //     style: TextStyle(color: Colors.deepPurple),
                        //   ),
                        // ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed:  isLoading ? null: _login
                        ,
                        child: isLoading?CircularProgressIndicator():
                         Text(
                          TextConstants.signIn,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                     if (authProvider.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          authProvider.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                          side: BorderSide(color: Colors.deepPurple.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                        },
                        child: const Text(TextConstants.createAccount),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1, indent: 20, endIndent: 10)),
                  Text(TextConstants.orSignInWith),
                  Expanded(child: Divider(thickness: 1, indent: 10, endIndent: 20)),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async{
                          final authProvider = Provider.of<AuthProvider>(context, listen: false);
                           await authProvider.signInWithGoogleAcc();
                             if (authProvider.user != null) {
                                Navigator.pushReplacement( context,
                                MaterialPageRoute(builder: (_) => const BottomNavMenu()),
                               );
                             } else {
                           ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Text(authProvider.errorMessage!)),
                               );
                            }
                              },
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                               border: Border.all(color: Colors.blue, width: 2),
                                 shape: BoxShape.circle,
                              ),
                          child: Image.asset("assets/images/google_logo.jpeg",fit: BoxFit.contain,),
                           ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    }

  } 