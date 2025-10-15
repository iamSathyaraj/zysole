import 'dart:io';
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/admin/controllers/product_provider.dart';
import 'package:e_commerce/admin/models/product_model.dart';
import 'package:e_commerce/controllers/category_provider.dart';
import 'package:e_commerce/controllers/supabse_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class AddProductScreen extends StatefulWidget {
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final TextEditingController categoryController=TextEditingController();


Future<void> _pickImage() async {

  showModalBottomSheet(
    context: context, builder: (context){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("pick image from gallery"),
              onTap: () {
                Navigator.pop(context);
               _pickImageSource(ImageSource.gallery);
              },
            ),
            ListTile(
                 leading: Icon(Icons.photo_camera),
                 title: Text("pick image through camera"),
                 onTap: (){
                  Navigator.pop(context);
                  _pickImageSource(ImageSource.camera);
                 },
            )
          ],
        
        ),
      ),
    );
  });
  
}

Future<void>_pickImageSource(ImageSource source)async{

  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
if (pickedFile != null) {
    setState(() {
      _pickedImage = File(pickedFile.path);
    });
  }

}


  final _formKey = GlobalKey<FormState>();
  String? productName ;
  String? description ;
  double? price ;
  String? brand;
  int? stockQuantity ;
  bool isActive = true;
  File? _pickedImage; 

  final List<String> categories = [];
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

void _submitForm() async {
  final enteredCategory = categoryController.text.trim();

  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);

    if (enteredCategory.isNotEmpty && !categoryProvider.categories.contains(enteredCategory)) {
      categoryProvider.addCategory(enteredCategory);
    }

    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    final supabaseImageProvider = Provider.of<SupabaseImageProvider>(context, listen: false);

    String imageUrl = '';
    if (_pickedImage != null) {
      await supabaseImageProvider.uploadImage(_pickedImage!, 'products');
      imageUrl = supabaseImageProvider.uploadedImageUrl ?? '';
    }

    final product = Product(
      id: '',
      name: productName!,
      description: description!,
      price: price!,
      category: enteredCategory,
      stock: stockQuantity!,
      color: selectedColor,
      size: selectedSize,
      imageUrl: imageUrl,
    );

    await productProvider.addSingleProduct(product);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product successfully added!')),
    );

    Navigator.pop(context);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text('Add Product',style: TextStyle(color: Colors.white),),
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
                  GestureDetector(
  onTap: _pickImage,
  child: Container(
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(12),
    ),
    child: _pickedImage != null
        ? Image.file(_pickedImage!, fit: BoxFit.cover)
        : const Icon(Icons.camera_alt_outlined, size: 50, color: Colors.grey),
  ),
      ),
      const SizedBox(height: 16),

                  _buildTextField('Product Name', onSaved: (val) => productName = val!, validator: _requiredValidator),
                  // TextFormField(
                  //   controller: nameController,
                  // ),
                  SizedBox(height: 16),
                   TextFormField(
                      controller: categoryController,
                         decoration: InputDecoration(
                           labelText: 'Category',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                 ),
                           validator: (value) => (value == null || value.trim().isEmpty) ? 'Please enter a category' : null,
                                   ),
                  // _buildTextField('category', onSaved: (val) => productName = val!, validator: _requiredValidator),

                  // _buildDropdown(),
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
          SingleChildScrollView(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedSize = size;
                });
              },
              child: Container( 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedSize == size ? Colors.deepPurple : Colors.grey, 
                  
                ),
                height: 40,
                width: 40,
                child: Center(child: Text(size.toString())),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      );
    }).toList()
                ),
                  SizedBox(height: 24),
              
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
