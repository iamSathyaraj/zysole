import 'dart:math';

import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/util/theme/constants/text_strings.dart';
import 'package:e_commerce/views/bottom_nav_menu.dart';
import 'package:e_commerce/views/cart_screen.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:e_commerce/views/sign%20up/verify_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/controllers/auth_provider.dart';

  class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formaKey=GlobalKey<FormState>();

      TextEditingController firsnNameController = TextEditingController();
      TextEditingController lastNameController = TextEditingController();
      TextEditingController userNameController = TextEditingController();
      TextEditingController emailController = TextEditingController();    
      TextEditingController phoneNumberController = TextEditingController();
      TextEditingController passwordController = TextEditingController();

      final  bool _obscurePassword = true;

     Future<void>_signUp()async{
       if(_formaKey.currentState!.validate()){

          final AppUser appUser=AppUser(id: "", 
          name: "${firsnNameController.text}${lastNameController.text}",
          email: emailController.text.trim(),
          role: "user"
        );
          final authProvider=Provider.of<AuthProvider>(context, listen: false);
          try {
          await  authProvider.signUpUser(appUser, passwordController.text.trim()
          );

          if(authProvider.user !=null){
              // await authProvider.resendEmailVerification();
              Navigator.pushReplacement(
                context, MaterialPageRoute(
                  builder: (context)=>BottomNavMenu()
                  ));
             } else if(authProvider.errorMessage!=null){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authProvider.errorMessage!),));
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
      firsnNameController.dispose();
      lastNameController.dispose();
      userNameController.dispose();
      emailController.dispose();
      phoneNumberController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text("Create Account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                const SizedBox(height: 15),
                Form(
                  key: _formaKey,
                  child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firsnNameController,
                            validator: (value) {
                               if(value==null||value.isEmpty){
                                return "firstName required";
                               }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                // borderSide: BorderSide(color: Colors.black)
                              ),
                              labelText: TextConstants.firstName,
                              prefixIcon: Icon(Icons.person),
                              // prefixIcon: Icon(iconsax.user)
                          ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                               if(value==null||value.isEmpty){
                                return "lastname required";
                               }
                            },
                            controller: lastNameController,
                              decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                // borderSide: BorderSide(color: Colors.black)
                              ),
                              labelText: TextConstants.lastName,
                              prefixIcon: Icon(Icons.person)
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: userNameController,
                      validator: (value) {
                         if (value == null || value.isEmpty) {
                         return "Username is required";
                         }
                      },
                      expands: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 42, 103, 244))
                        ),
                      labelText: TextConstants.userName,
                      prefixIcon: Icon(Icons.person)
                    ),
                    ),
                    const SizedBox(height: 15),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty){
                           return "Email is required";

                          }
                        },
                      expands: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 42, 103, 244))
                        ),
                      labelText: TextConstants.email,
                      prefixIcon: Icon(Icons.email)
                    ),
                    ),
                    const SizedBox(height: 15),
                      TextFormField(
                        controller: phoneNumberController,
                        validator: (value) {
                         if (value == null || value.isEmpty) return "Phone number is required";
                        if (!RegExp(r'^\+?\d{10,13}$').hasMatch(value)){
                          return "Enter a valid phone number";
                          
                        }
                        return null;
                        },
                      expands: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 42, 103, 244))

                        ),
                      labelText: TextConstants.phoneNum,
                      prefixIcon: Icon(Icons.phone)
                    ),
                    ),
                    const SizedBox(height: 15),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                        if(value==null || value.isEmpty){
                          return "password required";
                        }else if(value.length<6){
                          return "password must be atleast 6 characters";
                        }
                        if(!value.contains(RegExp(r'[A-Z]'))){
                          return " password must contain atleast one uppercase letter";
                        }
                        if(!value.contains(RegExp(r'[0-9]'))){
                          return "password must contain atleast one digit";
                        }
                        if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
                          return "password must contains atleast one special character";
                        }
                        return null;
                        },
                        obscureText: _obscurePassword?false:true,
                      expands: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(color: const Color.fromARGB(255, 42, 103, 244))

                        ),
                      labelText: TextConstants.password,
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: _obscurePassword? Icon(Icons.visibility):Icon(Icons.visibility_off)
                      // Icon(Icons.visibility)
                    ),
                    ),
                    const SizedBox(height: 25),
                    
                  SizedBox(width: double.infinity,height: 50, child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4b68ff),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
                    onPressed: _signUp,
                     child: Text(TextConstants.createAccount))),
                  SizedBox(height: 20),
                   Row(
                   children: [
                  Flexible(child: Divider(color: Colors.black, indent: 60, endIndent: 5)),
                  Text(TextConstants.orSignInWith),
                  Flexible(child: Divider(color: Colors.black, indent: 5, endIndent: 60))
                  ],
                 ), 

                  ],
                )
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                },
                 icon: Row(
                  mainAxisSize: MainAxisSize.min,
                   children: [
                     Icon(Icons.add),
                     Icon(Icons.add)
                   ],
                 ))
              ],
            ),
          ),
        ),
      );
    }
  }
  

