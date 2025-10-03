// import 'dart:math';

// import 'package:e_commerce/models/user_model.dart';
// import 'package:e_commerce/util/theme/constants/text_strings.dart';
// import 'package:e_commerce/views/bottom_nav_menu.dart';
// import 'package:e_commerce/views/cart_screen.dart';
// import 'package:e_commerce/views/login_screen.dart';
// import 'package:e_commerce/views/sign%20up/verify_email_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:e_commerce/controllers/auth_provider.dart';

//   class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {

//   final GlobalKey<FormState> _formaKey=GlobalKey<FormState>();

//       TextEditingController firsnNameController = TextEditingController();
//       TextEditingController lastNameController = TextEditingController();
//       TextEditingController userNameController = TextEditingController();
//       TextEditingController emailController = TextEditingController();    
//       TextEditingController phoneNumberController = TextEditingController();
//       TextEditingController passwordController = TextEditingController();

//       final  bool _obscurePassword = true;

//      Future<void>_signUp()async{
//        if(_formaKey.currentState!.validate()){

//           final AppUser appUser=AppUser(id: "", 
//           name: "${firsnNameController.text}${lastNameController.text}",
//           email: emailController.text.trim(),
//           role: "user"
//         );
//           final authProvider=Provider.of<AuthProvider>(context, listen: false);
//           try {
//           await  authProvider.signUpUser(appUser, passwordController.text.trim()
//           );

//           if(authProvider.user !=null){
//               // await authProvider.resendEmailVerification();
//               Navigator.pushReplacement(
//                 context, MaterialPageRoute(
//                   builder: (context)=>BottomNavMenu()
//                   ));
//              } else if(authProvider.errorMessage!=null){
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authProvider.errorMessage!),));
//              }
//          } catch (e) {
//            ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Signup failed: $e")),
//         );
//          }
//         }
//      }

//       @override
//       void dispose() {
//       firsnNameController.dispose();
//       lastNameController.dispose();
//       userNameController.dispose();
//       emailController.dispose();
//       phoneNumberController.dispose();
//       passwordController.dispose();
//       super.dispose();
//     }

//     @override
//     Widget build(BuildContext context) {
//       return  Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(14.0),
//             child: Column(
//               children: [
//                 Text("Create Account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
//                 const SizedBox(height: 15),
//                 Form(
//                   key: _formaKey,
//                   child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             controller: firsnNameController,
//                             validator: (value) {
//                                if(value==null||value.isEmpty){
//                                 return "firstName required";
//                                }
//                             },
//                             decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFFB39DDB)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFF673AB7), width: 2),
//                         ),
//                               // border: OutlineInputBorder(
//                               //   borderRadius: BorderRadius.circular(10),
//                               //   // borderSide: BorderSide(color: Colors.black)
//                               // ),
//                               labelText: TextConstants.firstName,
//                               prefixIcon: Icon(Icons.person),
//                               // prefixIcon: Icon(iconsax.user)
//                           ),
//                           ),
//                         ),
//                         SizedBox(width: 15),
//                         Expanded(
//                           child: TextFormField(
//                             validator: (value) {
//                                if(value==null||value.isEmpty){
//                                 return "lastname required";
//                                }
//                             },
//                             controller: lastNameController,
//                               decoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFFB39DDB)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFF673AB7), width: 2),
//                         ),
//                               // border: OutlineInputBorder(
//                               //   borderRadius: BorderRadius.circular(10),
//                               //   // borderSide: BorderSide(color: Colors.black)
//                               // ),
//                               labelText: TextConstants.lastName,
//                               prefixIcon: Icon(Icons.person)
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     TextFormField(
//                       controller: userNameController,
//                       validator: (value) {
//                          if (value == null || value.isEmpty) {
//                          return "Username is required";
//                          }
//                       },
//                       expands: false,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFFB39DDB)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFF673AB7), width: 2),
//                         ),
//                         // enabledBorder: OutlineInputBorder(
//                         //   borderRadius: BorderRadius.circular(10),
//                         //   borderSide: BorderSide(color: const Color(0xFFB39DDB))
//                         // ),
//                         // focusedBorder: OutlineInputBorder(
//                         //   borderRadius: BorderRadius.circular(10),
//                         //   borderSide: BorderSide(color: const Color(0xFF673AB7))
//                         // ),
//                         // border: OutlineInputBorder(
//                         //   borderRadius: BorderRadius.circular(10),
//                         //   borderSide: BorderSide(color: const Color.fromARGB(255, 130, 42, 244))
//                         // ),
//                       labelText: TextConstants.userName,
//                       prefixIcon: Icon(Icons.person)
//                     ),
//                     ),
//                     const SizedBox(height: 15),
//                       TextFormField(
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value == null || value.isEmpty){
//                            return "Email is required";

//                           }
//                         },
//                       expands: false,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFFB39DDB)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFF673AB7), width: 2),
//                         ),
//                         // border: OutlineInputBorder(
//                         //   borderRadius: BorderRadius.circular(10),
//                         //   borderSide: BorderSide(color: const Color.fromARGB(255, 42, 103, 244))
//                         // ),
//                       labelText: TextConstants.email,
//                       prefixIcon: Icon(Icons.email)
//                     ),
//                     ),
//                     const SizedBox(height: 15),
//                       TextFormField(
//                         controller: phoneNumberController,
//                         validator: (value) {
//                          if (value == null || value.isEmpty) return "Phone number is required";
//                         if (!RegExp(r'^\+?\d{10,13}$').hasMatch(value)){
//                           return "Enter a valid phone number";
                          
//                         }
//                         return null;
//                         },
//                       expands: false,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFFB39DDB)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFF673AB7), width: 2),
//                         ),
//                         // border: OutlineInputBorder(
//                         //   borderRadius: BorderRadius.circular(10),
//                         //   borderSide: BorderSide(color: const Color.fromARGB(255, 42, 103, 244))

//                         // ),
//                       labelText: TextConstants.phoneNum,
//                       prefixIcon: Icon(Icons.phone)
//                     ),
//                     ),
//                     const SizedBox(height: 15),
//                       TextFormField(
//                         controller: passwordController,
//                         validator: (value) {
//                         if(value==null || value.isEmpty){
//                           return "password required";
//                         }else if(value.length<6){
//                           return "password must be atleast 6 characters";
//                         }
//                         if(!value.contains(RegExp(r'[A-Z]'))){
//                           return " password must contain atleast one uppercase letter";
//                         }
//                         if(!value.contains(RegExp(r'[0-9]'))){
//                           return "password must contain atleast one digit";
//                         }
//                         if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
//                           return "password must contains atleast one special character";
//                         }
//                         return null;
//                         },
//                         obscureText: _obscurePassword?false:true,
//                       expands: false,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFFB39DDB)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: const Color(0xFF673AB7), width: 2),
//                         ),
//                         // border: OutlineInputBorder(
//                         //   borderRadius: BorderRadius.circular(10),
//                         //    borderSide: BorderSide(color: const Color.fromARGB(255, 42, 103, 244))

//                         // ),
//                       labelText: TextConstants.password,
//                       prefixIcon: Icon(Icons.password),
//                       suffixIcon: _obscurePassword? Icon(Icons.visibility):Icon(Icons.visibility_off)
//                       // Icon(Icons.visibility)
//                     ),
//                     ),
//                     const SizedBox(height: 25),
                    
//                   SizedBox(width: double.infinity,height: 50, child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF673AB7),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
//                     onPressed: _signUp,
//                      child: Text(TextConstants.createAccount,style: TextStyle(color: Colors.white),))),
//                   SizedBox(height: 20),
//                    Row(
//                    children: [
//                   Flexible(child: Divider(color: Colors.black, indent: 60, endIndent: 5)),
//                   Text(TextConstants.orSignInWith),
//                   Flexible(child: Divider(color: Colors.black, indent: 5, endIndent: 60))
//                   ],
//                  ), 

//                   ],
//                 )
//                 ),
//                 IconButton(onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
//                 },
//                  icon: Row(
//                   mainAxisSize: MainAxisSize.min,
//                    children: [
//                      Icon(Icons.add),
//                      Icon(Icons.add)
//                    ],
//                  ))
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
  

import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/util/theme/constants/text_strings.dart';
import 'package:e_commerce/views/bottom_nav_menu.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/controllers/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      final AppUser appUser = AppUser(
        id: "",
        name: "${firstNameController.text} ${lastNameController.text}",
        email: emailController.text.trim(),
        role: "user",
      );

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      try {
        await authProvider.signUpUser(appUser, passwordController.text.trim());

        if (authProvider.user != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => BottomNavMenu()));
        } else if (authProvider.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(authProvider.errorMessage!)),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup failed: $e")),
        );
      }
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFB39DDB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF673AB7), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),

            /// Title
            Text(
              "Create Account",
              style: const TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              "Sign up to get started with your shopping journey",
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 40),

            /// Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: firstNameController,
                          validator: (v) =>
                              v!.isEmpty ? "First name required" : null,
                          decoration:
                              _inputDecoration(TextConstants.firstName, Icons.person),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          validator: (v) =>
                              v!.isEmpty ? "Last name required" : null,
                          decoration:
                              _inputDecoration(TextConstants.lastName, Icons.person),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: userNameController,
                    validator: (v) =>
                        v!.isEmpty ? "Username is required" : null,
                    decoration:
                        _inputDecoration(TextConstants.userName, Icons.person_outline),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => v!.isEmpty ? "Email is required" : null,
                    decoration:
                        _inputDecoration(TextConstants.email, Icons.email),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Phone required";
                      if (!RegExp(r'^\+?\d{10,13}$').hasMatch(v)) {
                        return "Enter valid phone number";
                      }
                      return null;
                    },
                    decoration:
                        _inputDecoration(TextConstants.phoneNum, Icons.phone),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Password required";
                      } else if (v.length < 6) {
                        return "At least 6 characters";
                      } else if (!v.contains(RegExp(r'[A-Z]'))) {
                        return "Must contain uppercase letter";
                      } else if (!v.contains(RegExp(r'[0-9]'))) {
                        return "Must contain a digit";
                      } else if (!v.contains(
                          RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return "Must contain special character";
                      }
                      return null;
                    },
                    decoration: _inputDecoration(
                      TextConstants.password,
                      Icons.lock,
                    ).copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  /// Signup Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF673AB7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _signUp,
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Divider with OR
                  Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        thickness: 1,
                        endIndent: 10,
                      )),
                      Text(
                        TextConstants.orSignInWith,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const Expanded(
                          child: Divider(
                        thickness: 1,
                        indent: 10,
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF673AB7)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
