//  import 'package:flutter/material.dart';

// class ProductDetailScreen extends StatefulWidget {
//   const ProductDetailScreen({super.key});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(

//       body: SafeArea(
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Container(
//                   height: 320,
//                   width: double.infinity,
//                   child: Image.asset("assets/images/",fit: BoxFit.contain),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                          color: const Color.fromARGB(255, 50, 49, 49),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Nike Air Max",style: TextStyle(color: Colors.white,
//                           fontSize: 23),),
//                           Text("data",style: TextStyle(color: Colors.white),),
//                           SizedBox(height: 15),
//                           Text("sdhjsajkd ksjad kjsnb l aSNDBL NLA SNDBLNB L N BL nbe NDBLnd blN Blndb LNB NDLMNCZXCNAHDS jdf jfbsajdfbsldbf",
//                           style: TextStyle(color: Colors.white),),
//                           SizedBox(height: 15),
//                           Text("Size:",style: TextStyle(color: Colors.white,fontSize: 20),),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: (){
                               
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(child: Text("6")),
//                                 ),
//                               ),
//                               SizedBox(width: 10),
//                               GestureDetector(
//                                 onTap: (){
                                 
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(child: Text("7")),
//                                 ),
//                               ),
//                               SizedBox(width: 10),
//                               GestureDetector(
//                                 onTap: (){
//                                  ;
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(child: Text("8")),
//                                 ),
//                               ),
//                               SizedBox(width: 10),
//                               GestureDetector(
//                                 onTap: (){
                        
                                 
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(child: Text("9")),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 15),
//                           Row(
//                             children: [
//                               Text("Colors",style: TextStyle(color: Colors.white,fontSize: 19),),
//                               SizedBox(width: 10),
//                               Container(
//                                 height: 25,
//                                 width: 25,
//                                 decoration: BoxDecoration(
//                                   color: Colors.amber,
//                                   borderRadius: BorderRadius.circular(400)
//                                 ),
//                               ),   SizedBox(width: 10),
//                               Container(
//                                 height: 25,
//                                 width: 25,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 253, 253, 252),
//                                   borderRadius: BorderRadius.circular(400)
//                                 ),
//                               ),   SizedBox(width: 10),
//                               Container(
//                                 height: 25,
//                                 width: 25,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 3, 91, 7),
//                                   borderRadius: BorderRadius.circular(400)
//                                 ),
//                               ),   SizedBox(width: 10),
//                               Container(
//                                 height: 25,
//                                 width: 25,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 7, 147, 255),
//                                   borderRadius: BorderRadius.circular(400)
//                                 ),
//                               ),   SizedBox(width: 10),
//                               Container(
//                                 height: 25,
//                                 width: 25,
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 255, 7, 40),
//                                   borderRadius: BorderRadius.circular(400)
//                                 ),
//                               )
                              
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
          
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedSize = 8;
  int selectedColor = 0;

  final List<int> sizes = [6, 7, 8, 9, 10, 11];
  final List<Color> colors = [
    Color(0xFFffb347), // orange
    Color(0xFFe75480), // pink
    Color(0xFFffcc80)  // yellowish
  ];

  // Replace with your own asset or network images
  final String mainImage = "https://i.imgur.com/6nK2MAl.png";
  final List<String> thumbImages = [
    "https://i.imgur.com/d6KcTMI.png",
    "https://i.imgur.com/d6KcTMI.png",
    "https://i.imgur.com/d6KcTMI.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 248, 248),
      body: Column(
        children: [
          // Top product image
          Expanded(
            child: Container(
              // height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      child: Image.network(
                        mainImage,
                        width: 220,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...thumbImages.map((img) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300]!,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Image.network(img, height: 48, width: 70, fit: BoxFit.contain),
                      )),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
      
          // Info container
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF22232A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name and icons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Nike Air Max 270",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Icon(Icons.star, color: Color(0xFFffb347), size: 18),
                      SizedBox(width: 2),
                      Text("4.8", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 16),
                      Icon(Icons.favorite_border, color: Colors.white),
                      SizedBox(width: 12),
                      Icon(Icons.bookmark_border, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    "men shoes",
                    style: TextStyle(color: Colors.grey[400], fontSize: 13),
                  ),
                  SizedBox(height: 18),
                  Text(
                    "the nike free metcon 3 combines nike free flexibility around the forefoot with metcon stability in the heel to help you get the most out of your training session",
                    style: TextStyle(color: Colors.grey[400], fontSize: 13),
                  ),
                  SizedBox(height: 24),
                  Text("Size :", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Row(
                    children: sizes.map((sz) {
                      final selected = selectedSize == sz;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = sz),
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 42,
                          height: 42,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected ? Colors.white : Color(0xFF353535),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: selected
                                ? [BoxShadow(color: Colors.black26, blurRadius: 6)]
                                : [],
                          ),
                          child: Text(
                            sz.toString(),
                            style: TextStyle(
                              color: selected ? Colors.black : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text("Colors :", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Row(
                    children: List.generate(colors.length, (i) {
                      final selected = selectedColor == i;
                      return GestureDetector(
                        onTap: () => setState(() => selectedColor = i),
                        child: Container(
                          margin: EdgeInsets.only(right: 16),
                          padding: EdgeInsets.all(selected ? 4 : 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: selected
                                ? Border.all(color: Colors.white, width: 2)
                                : null,
                          ),
                          child: CircleAvatar(
                            backgroundColor: colors[i],
                            radius: 12,
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price :",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            "\$290.00",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFFF6B6B),
                          minimumSize: Size(170, 48),
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {},
                        child: Text("Add To Cart"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
