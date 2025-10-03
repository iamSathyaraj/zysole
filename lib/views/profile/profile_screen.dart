import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Profile"),
         automaticallyImplyLeading: false,
         leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left)),
      ),
      body: SingleChildScrollView(
         child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Image.asset("assets/images/",fit: BoxFit.cover),
                    ),
                    TextButton(onPressed: (){}, child: const Text("change profile picture")
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Text("Profile Information"),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                   flex: 3, child: Text("Name",style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis)),
                  Expanded(
                    flex: 5, child: Text("Sathyaraj", style: TextStyle(fontSize: 22),overflow: TextOverflow.ellipsis)),
                  Expanded(child: const Icon(Icons.arrow_right)),
                ],
              )

            ],
          ),
          ),
      ),
      // body: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         SizedBox(
      //           height: 150,
      //           width: double.infinity,
      //           child: Container(
      //             color: Colors.blue,
      //           ),
                
      //         ),
      //         Container(

      //         )

      //       ],
      //     ),
      //     ListTile(
      //       title: Text("Unknown Pro",style: TextStyle(fontSize: 20),),
      //       subtitle: Text("unknown@gmail.com"),
      //       trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
      //     )
      //   ],
      // ),
    );
  }
}