  import 'package:e_commerce/controllers/auth_provider.dart';
  import 'package:e_commerce/util/theme/constants/colors.dart';
  import 'package:e_commerce/util/theme/constants/text_strings.dart';
import 'package:e_commerce/views/bottom_nav_menu.dart';
  import 'package:e_commerce/views/home_screen.dart';
  import 'package:e_commerce/views/sign%20up/verify_email_screen.dart';
  import 'package:e_commerce/views/sign%20up/signup_screen.dart';
  import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';

  class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> { 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }

  // class LoginScreen extends StatelessWidget {
  //   const LoginScreen({super.key});

    

    bool _rememberMe=false;
    bool _obscurePassword = true;

    final _formKey=GlobalKey<FormState>();

    TextEditingController emaiController =TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void>_login()async{
        if(_formKey.currentState!.validate()){

          final authProvider =Provider.of<AuthProvider>(context, listen: false);
        await  authProvider.loginUser(emaiController.text.trim(), 
        passwordController.text.trim());

      //  final firebaseUser = FirebaseAuth.instance.currentUser;
        // await firebaseUser?.reload();
         if (authProvider.firebaseUser !=null&& authProvider.user!=null) {
         Navigator.pushReplacement(
           context,
          MaterialPageRoute(builder: (_) => BottomNavMenu()),
          );
        } else {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(authProvider.errorMessage!)),
    );
}


        //   if(authProvider.user !=null ){
        //     if(authProvider.user!.emailVerified){

        //     Navigator.pushReplacement(context, (MaterialPageRoute(builder: (context)=>HomeScreen())));

        //     }else{
        //    Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (_) => const VerifyEmailScreen()),
        // );

        //     }

        //     // if(authProvider.user!.e)

        //   }

         }
      }
      @override
    Widget build(BuildContext context) {
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
                            const Text(TextConstants.rememberMe),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            TextConstants.forgetPassword,
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
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
                        onPressed: _login
                        ,
                        child: const Text(
                          TextConstants.signIn,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
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
                          child: Icon(Icons.g_mobiledata, size: 30, color: Colors.red),
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