 import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(

      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  child: Image.asset("assets/images/",fit: BoxFit.contain),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 50, 49, 49),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nike Air Max",style: TextStyle(color: Colors.white,
                          fontSize: 23),),
                          Text("data",style: TextStyle(color: Colors.white),),
                          SizedBox(height: 15),
                          Text("sdhjsajkd ksjad kjsnb l aSNDBL NLA SNDBLNB L N BL nbe NDBLnd blN Blndb LNB NDLMNCZXCNAHDS jdf jfbsajdfbsldbf",
                          style: TextStyle(color: Colors.white),),
                          SizedBox(height: 15),
                          Text("Size:",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                               
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("6")),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: (){
                                 
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("7")),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: (){
                                 ;
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("8")),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: (){
                        
                                 
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("9")),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text("Colors",style: TextStyle(color: Colors.white,fontSize: 19),),
                              SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(400)
                                ),
                              ),   SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 253, 253, 252),
                                  borderRadius: BorderRadius.circular(400)
                                ),
                              ),   SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 3, 91, 7),
                                  borderRadius: BorderRadius.circular(400)
                                ),
                              ),   SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 7, 147, 255),
                                  borderRadius: BorderRadius.circular(400)
                                ),
                              ),   SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 7, 40),
                                  borderRadius: BorderRadius.circular(400)
                                ),
                              )
                              
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}