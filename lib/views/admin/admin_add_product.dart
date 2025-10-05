import 'package:e_commerce/controllers/product_provider.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminAddProduct extends StatelessWidget {
   AdminAddProduct({super.key});
 
final _formKey=GlobalKey<FormState>();
 final _nameController=TextEditingController();
 final _priceController = TextEditingController();
 final _categoryController = TextEditingController();
 final _quantityController = TextEditingController();
 final _descriptionController = TextEditingController();

 Future<void>_saveProduct(Product product, BuildContext context)async{
  if(_formKey.currentState!.validate()){
    final productProviderr=Provider.of<ProductProvider>(context,listen: false);
    productProviderr.addSingleProduct(product);
  }
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add product"),centerTitle: true),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
            Text("Upload the product image"),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
            SizedBox(height: 30),
            Text("Product Name",
             style: TextStyle(
              color: const Color.fromARGB(255, 70, 69, 69),
              fontSize: 20),),
            Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 167, 177, 188)
              ),
              child: TextFormField(
                controller: _nameController,
                 validator: (value) {
                 if(value==null||value.isEmpty){
                      return "name required";
                      }
                }, 
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Column(
          
                children: [
                 Text("Price"),
                   SizedBox(height: 10),
             Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 167, 177, 188)
              ),
              child: TextFormField(
                controller: _priceController,
                 validator: (value ) {
                 if(value==null||value.isEmpty){
                      return "price required";
                      }
                },
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
              ),
                ]
               
                ),
          
             Column(
              children: [
                 Text("Qty"),
                   SizedBox(height: 10),
             Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 167, 177, 188)
              ),
              child: TextFormField(
                controller: _quantityController,
                validator: (value) {
                 if(value==null||value.isEmpty){
                      return "quantity required";
                      }
                } ,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
              ),
              ],
             )
            ]
            ),
          
            SizedBox(
              height: 20
            ),
             Text("Category"),
                   SizedBox(height: 10),
             Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 167, 177, 188)
              ),
              child: TextFormField(
                controller: _categoryController,
                validator: (value) {
                  if(value==null||value.isEmpty){
                    return "category required";
                  }
                },
                
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
              ),
              SizedBox(
              height: 20
            ),
             Text("subCategory"),
                   SizedBox(height: 10),
             Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 167, 177, 188)
              ),
              child: TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
              ),
              SizedBox(height: 20),
           Text("description"),
                   SizedBox(height: 10),
             Container(
              width: 150,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 167, 177, 188)
              ),
              child: TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 20,
                width: 80,
                child: ElevatedButton(onPressed: (){},
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue),
                 child: Text("Upload Product"),
                 )
                 )
          ]
          ),
        ),
      ),
    );
  }
}