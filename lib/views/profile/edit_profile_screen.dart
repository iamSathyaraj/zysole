
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/auth/controller/auth_provider.dart';
import 'package:e_commerce/admin/controllers/supabse_image_provider.dart';
import 'package:e_commerce/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<AuthProviderr>(context, listen: false).user;
    _nameController = TextEditingController(text: user?.name ?? '');
    _userNameController = TextEditingController(text: user?.userName ?? '');
    _emailController = TextEditingController(text: user!.email);
    _phoneController = TextEditingController(text: user.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
        _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void>_pickImage()async{
  
  showModalBottomSheet(context: context, builder: (context){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("pick image from gallery"),
              onTap: (){
                Navigator.pop(context);
                _pickImageResource(ImageSource.gallery);
              },
            ),
              ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text("pick image from camera"),
              onTap: (){
                _pickImageResource(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  });


  }
  Future<void>_pickImageResource(ImageSource source)async{
  final picker = ImagePicker();
  final pickedImages = await picker.pickImage(source: source);
  if(pickedImages!=null){
    setState(() {
          _pickedImages=File(pickedImages.path);

    });
  }



  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
 

  final authProvider = Provider.of<AuthProviderr>(context, listen: false);
  final supabaseImageProvider=Provider.of<SupabaseImageProvider>(context, listen: false);
  final userId=authProvider.user?.id ?? '';
 
  String profileImageUrl='';

   if(_pickedImages!=null){
    // await supabaseImageProvider.uploadProfileimage(_pickedImages!, userId, 'profile');
    // profileImageUrl=
    //  await SupabaseImageProvider().uploadProfileimage(_pickedImages!, userId, 'profile');
     profileImageUrl=    await supabaseImageProvider.uploadProfileimage(_pickedImages!, userId, 'profile')??"";

    //  supabaseImageProvider.uploadedProfileImage!;

   }


      // final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final updatedUser = AppUser(
        id: authProvider.user!.id,
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        role: authProvider.user!.role,
        phone: _phoneController.text.trim(),
        profileImage: profileImageUrl
      );

      await authProvider.updateProfile(updatedUser);
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile Updated successfully")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix errors in the form")),
       );
     }
   }

   File? _pickedImages;

  InputDecoration _inputDecoration(String label, {IconData? icon}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: icon != null ? Icon(icon, color: Colors.deepPurple) : null,
      filled: true,
      fillColor: Colors.deepPurple.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          shadowColor: const Color(0xFF673AB7).withValues(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      _pickImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                      color: const Color.fromARGB(100, 104, 58, 183),
                      borderRadius: BorderRadius.circular(10)
                      ),
                      height: 100,
                      width: 100,
                      child: _pickedImages!=null? ClipRRect(  
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(_pickedImages!, fit: BoxFit.cover,),
                      ):
                      Icon(Icons.image_outlined,size: 50,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _nameController,
                    decoration: _inputDecoration("Full Name", icon: Icons.person),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Enter your name" : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: _inputDecoration("Phone Number", icon: Icons.phone),
                    validator: (value) {
                      if (value == null || value.trim().length < 10) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _saveProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        shadowColor: Colors.deepPurpleAccent,
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              // strokeWidth: 3,
                            )
                          : const Text(
                              "Save Changes",
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 250, 250),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
