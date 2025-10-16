import 'package:e_commerce/auth/controller/auth_provider.dart';
import 'package:e_commerce/user/controller/address_provider.dart';
import 'package:e_commerce/user/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
final Address? address;

  const AddressScreen({super.key, this.address});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController line1Controller;
  // late TextEditingController line2Controller ;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController countryController;
  late TextEditingController postalCodeController;

  @override
  void initState() {
    super.initState();
    line1Controller = TextEditingController(text: widget.address?.street ?? '');
// line2Controller = TextEditingController(text: widget.address?. ?? ''); // if line 2 exists, else ''
cityController = TextEditingController(text: widget.address?.city ?? '');
stateController = TextEditingController(text: widget.address?.state ?? '');
postalCodeController = TextEditingController(text: widget.address?.postalCode ?? '');
countryController = TextEditingController(text: widget.address?.country ?? '');


  }

   @override
  void dispose() {
    line1Controller.dispose();
    // line2Controller.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    countryController.dispose();
    stateController.dispose();
    super.dispose();
  }

   Future<void> _saveAddress() async {
    if (_formKey.currentState?.validate() ?? false) {
      final userId = Provider.of<AuthProviderr>(context, listen: false).user?.id ?? '';
      final addressProvider = Provider.of<AddressProvider>(context, listen: false);

      final newAddress = Address(
        id: widget.address?.id ?? userId, // use userId as doc id or generate unique id
        userId: userId,
        street: line1Controller.text.trim(),
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        postalCode: postalCodeController.text.trim(),
        country: countryController.text.trim(),
        // phoneNumber: postalCodeController.text.trim(),
      );

      await addressProvider.saveAddress(newAddress);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address saved successfully')),

      );
    

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff8f9fb),
        appBar: AppBar(
          title: const Text("Add Address"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customLabel("Address Line 1"),
                customTextField( line1Controller, "Enter address line 1", true),

                // customLabel("Address Line 2 (optional)"),
                // customTextField(line2Controller, "Enter address line 2", false),

                customLabel("City"),
                customTextField(cityController, "Enter city", true),

                customLabel("State"),
                customTextField(stateController, "Enter state", true),
                
                customLabel("Country"),
                customTextField(countryController, "Enter country", true),

                customLabel ("Postal Code"),
                customTextField(postalCodeController, "Enter postal code", true),

                const SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _saveAddress();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Address saved successfully!"),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Save Address",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget customTextField(TextEditingController controller, String hint, bool isRequired) {
    return TextFormField(
      controller: controller,
      validator: isRequired
          ? (value) =>
              value == null || value.trim().isEmpty ? "This field is required" : null
          : null,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 1.5),
        ),
      ),
    );
  }
}
