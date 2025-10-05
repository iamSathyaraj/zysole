import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),
      appBar: AppBar(
        title: Text("Shopping Cart", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        actions: [
          Icon(Icons.luggage)
        ],
      ),
      body: Padding(padding: EdgeInsets.only(left: 24,right: 24,bottom: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index)=>
            // Column(
            //   children: [
            
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
            BoxShadow(
              color: const Color(0xFFDDDDDD).withValues(),
              blurRadius: 2,
              offset: Offset(0, 2)
            )
                  ]
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
            Container(
               height: 120,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
              ),
             
              padding: EdgeInsets.all(8),
                
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/nike_air_max.png",
                fit: BoxFit.contain,),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text("Nike Air Max",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                      Text("696",style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                               color: const Color.fromARGB(255, 237, 231, 213),
                          ),
                       
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.add))),
                          SizedBox(width: 10),
                        Text("-"),
                        SizedBox(width: 10),
                        // IconButton(onPressed: (){
              
                        // }, icon: Icon(Icons.add))
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                               color: const Color.fromARGB(255, 237, 231, 213),
                          ),
                       
                          child: IconButton(onPressed: (){}, icon: Icon(Icons.add))),
                      ],)
                    ],
                  ),
                  Column(
                    children: [
                      Text("l"),
                      Text("m")
                    ],
                  )
                ],
              ),
            )
                
                  ],
                ),
              // ),
              //         ],
            )
            , separatorBuilder: (context,index)=>SizedBox(height: 10), itemCount: 10),
          ),
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 225, 223, 217),
            

            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text("Order Summary",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Divider(color: Colors.black),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:",style: TextStyle(fontSize: 18),),
                      Text("789",style: TextStyle(fontSize: 18),),
                  
                    ],
                  ),
                ),
                SizedBox( width: 180, child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),child: Text("Checkout",style: TextStyle(color: Colors.white),)))
              ],
            ),
          )
        ],
      ),
      
      ),
    );
  }
}