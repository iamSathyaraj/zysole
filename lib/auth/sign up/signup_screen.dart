import 'package:e_commerce/user/models/user_model.dart';
import 'package:e_commerce/core/constants/text_strings.dart';
import 'package:e_commerce/user/views/bottom_nav_menu.dart';
import 'package:e_commerce/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/auth/controller/auth_provider.dart';

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
  TextEditingController passwordConfirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      
     final String password = passwordController.text.trim();
      final String passwordConfirm=passwordConfirmController.text.trim();
if(password!=passwordConfirm){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password do not mathch"),));
  setState(() {
    _isLoading=false;
  });
  return;
}

      final AppUser appUser = AppUser(
        id: "",
        name: "${firstNameController.text} ${lastNameController.text}",
        email: emailController.text.trim(),
        role: "user",
        phone: phoneNumberController.text.trim()
      );

      final authProvider = Provider.of<AuthProviderr>(context, listen: false);
        await authProvider.signUpUser(appUser, password);

        if (authProvider.user != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => BottomNavMenu()));
        } else if (authProvider.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(authProvider.errorMessage!)),
          );
        }
      // } catch (e) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Signup failed: $e")),
        // );
      // }
       setState(() {
      _isLoading = false;
    });
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
     passwordConfirmController.dispose();
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
                  const SizedBox(height: 15),
                  TextFormField(
                   controller: passwordConfirmController,
                       obscureText: _obscurePassword,
                       validator: (value) =>
                         value == null || value.isEmpty ? "Confirm your password" : null,
                      decoration: _inputDecoration(TextConstants.confirmPassword, Icons.lock),
              ),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF673AB7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _isLoading?null:    _signUp,
                      child: _isLoading?CircularProgressIndicator():
                       const Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

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
