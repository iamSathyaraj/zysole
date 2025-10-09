import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/user/user_model.dart';
import 'package:flutter/material.dart';
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
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    _nameController = TextEditingController(text: user?.name ?? '');
    _userNameController=TextEditingController(text: user?.userName ?? '');
    _emailController = TextEditingController(text: user!.email);
    _phoneController = TextEditingController(text: user.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
 final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final updatedUser = AppUser(
      id: authProvider.user!.id,
       name: _nameController.text.trim(),
        email: _emailController.text.trim(),
         role: authProvider.user!.role,
         phone: _phoneController.text.trim());

    await authProvider.updateProfile(updatedUser);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Updated sucessfuly")));
    Navigator.pop(context);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error in profile updating")));
    }

    // setState(() => _isLoading = true);

   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter your name" : null,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value == null || value.length < 10
                        ? "Enter valid phone number"
                        : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Save Changes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
