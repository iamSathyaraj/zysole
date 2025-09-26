import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Container(
                  color: Colors.blue,
                ),
                
              ),
              Container(

              )

            ],
          ),
          ListTile(
            title: Text("Unknown Pro",style: TextStyle(fontSize: 20),),
            subtitle: Text("unknown@gmail.com"),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          )
        ],
      ),
    );
  }
}