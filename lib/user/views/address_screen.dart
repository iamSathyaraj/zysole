import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Address line 1"),
            SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              )
              ,
               Text("Address line 2 (optional)"),
            SizedBox(height: 10),
                TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
               Text("city"),
                 TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            SizedBox(height: 10),
               Text("country"),
              Spacer(),
                TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            SizedBox(height: 10), 
               Text("country"),
                TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}