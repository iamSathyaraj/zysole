import 'package:flutter/material.dart';

class Newscreen extends StatelessWidget {
  const Newscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 0.1,
                offset: Offset(0, 2),
                color: const Color.fromARGB(31, 0, 0, 0)
              )
            ]

          ),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("data kjhb jhpkjb jkbn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 20,),
              Text("data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                          SizedBox(height: 20,),
        
              Text("data",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
        
            ],
          ),
        ),
      ),
    );
  }
}