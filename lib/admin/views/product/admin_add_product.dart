import 'dart:io';

import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String? productName ;
  String? description ;
  double? price ;
  String? brand;
  // double discount = 0.0;
  int? stockQuantity ;
  bool isActive = true;
  File? _pickedImage; 

  final List<String> categories = ['nike', 'adidas', 'puma'];
  String? selectedCategory;

  final Map<String, bool> sizes = {
    '9': false,
    '10': false,
    '11': false,
    '12': false,
  };
  Color? selectedColor;
  int? selectedSize;

  final List<int>sizess=[9,10,11,12,13];

  final List<Color> colorsList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

//  final TextEditingController nameController=TextEditingController();
//   final TextEditingController brandController=TextEditingController();
//  final TextEditingController descController=TextEditingController();
//  final TextEditingController priceController=TextEditingController();
//  final TextEditingController stockController=TextEditingController();
//  final TextEditingController szeController=TextEditingController();
//   final TextEditingController colorController=TextEditingController();




  // Future<void> _pickImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     setState(() {
  //       _pickedImage = File(image.path);
  //     });
  //   }
  // }

  void _submitForm() async{ 
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    if (_formKey.currentState!.validate()) {


//       if(_pickedImage==null){
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please pick an image"),));
// return;

//       }
      _formKey.currentState!.save();
      // String imageUrl=await productProvider.uploadImageToFirebase(_pickedImage!);

      final product=Product(
        id: '',
         name: productName!,
         description: description!,
          price: price!,
          
          //  imageUrl: imageUrl,
            category: selectedCategory ?? '',
             stock: stockQuantity!,
              brand: brand!, 
              color: selectedColor,
              size: selectedSize,
              // isFavorite: 
              );
              await productProvider.addSingleProduct(product);

      // Build product data here, e.g. assign sizes and colors selected

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product successfully added!')));
          Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('Product Name', onSaved: (val) => productName = val!, validator: _requiredValidator),
                  // TextFormField(
                  //   controller: nameController,
                  // ),
                  SizedBox(height: 16),
                  _buildDropdown(),
                  SizedBox(height: 16),
                  _buildTextField('Description', maxLines: 4, onSaved: (val) => description = val ?? ''),
                  SizedBox(height: 16),
                  _buildTextField('Price', keyboardType: TextInputType.number, onSaved: (val) => price = double.parse(val!), validator: _numberValidator),
                  SizedBox(height: 16), 
                  // _buildTextField('Discount', keyboardType: TextInputType.number, onSaved: (val) => discoun = double.tryParse(val ?? '') ?? 0.0),
                  SizedBox(height: 16),
                  _buildTextField('Stock Quantity', keyboardType: TextInputType.number, onSaved: (val) => stockQuantity = int.parse(val!), validator: _intValidator),
                  SizedBox(height: 16),
                  Text('Select Sizes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 10),
                  Row(
                    children: 
                      colorsList.map((color){
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedColor=color;
                                });
                              },
                              child: Container( 
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: color,
                                  border: selectedColor==color?  Border.all(width: 5): Border.all()
                                ),
                                height: 30,
                                width: 30,
                                
                              ),
                            ),
                           SizedBox(width: 10)
                          ],
                        );
                      }).toList()
                    
                  ),

                  SizedBox(height: 20),
                  Row(
  children: 
    sizess.map((size){
      return Row(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                selectedSize = size;
              });
            },
            child: Container( 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedSize == size ? Colors.deepPurple : Colors.grey, // ✅ Visual feedback
                
              ),
              height: 50,
              width: 50,
              child: Center(child: Text(size.toString())),
            ),
          ),
          SizedBox(width: 10),
        ],
      );
    }).toList()
                ),
                  SizedBox(height: 24),
                  // Placeholder for Image Picker section
                  // GestureDetector(
                  //   onTap: (){
                  //    _pickImage();
                  //   },
                  //   child: Container(
                  //     height: 150,  
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                  //     child: Center(
                  //       child: _pickedImage != null
                  //              ? Image.file(_pickedImage!, fit: BoxFit.cover)
                  //               : Icon(Icons.camera_alt_outlined, size: 50, color: Colors.grey),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 32),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: _submitForm,
                      child: Text('Add Product', style: TextStyle(fontSize: 18,color: Colors.white)),
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

  // Widget _customTextField(String label,)

  Widget _buildTextField(String label,
      {int maxLines = 1,
      required FormFieldSetter<String> onSaved,
      String? Function(String?)? validator,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      maxLines: maxLines,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          labelText: 'Brand',
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      value: selectedCategory,
      items: categories
          .map((category) => DropdownMenuItem(value: category, child: Text(category)))
          .toList(),
      onChanged: (value) => setState(() { selectedCategory = value;
      brand=value;}
      ),
      validator: (value) => value == null ? 'Please select a category' : null,
    );
  }

  String? _requiredValidator(String? value) {
    return value == null || value.trim().isEmpty ? 'This field is required' : null;
  }

  String? _numberValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    if (double.tryParse(value) == null) return 'Enter a valid number';
    return null;
  }

  String? _intValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    if (int.tryParse(value) == null) return 'Enter a valid integer';
    return null;
  }
}
