import 'package:e_commerce/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
              Image.asset("assets/images/banner.png"),
            SizedBox(height: 36),
            Text("Account Created",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("congratulations your account created",textAlign: TextAlign.center),
             SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
             }, child: Text("data")
            ),
            ),
          ],
        ),
        ),
      ),
      appBar: AppBar(),
      );
  }
}