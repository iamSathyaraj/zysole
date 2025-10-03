import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/controllers/auth_provider.dart';
import 'package:e_commerce/controllers/product_provider.dart';
import 'package:e_commerce/views/login_screen.dart';
import 'package:e_commerce/widgets/custom_search_bar.dart';
import 'package:e_commerce/widgets/home_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider=Provider.of<ProductProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(36, 123, 209, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hello User",style: TextStyle(fontWeight: FontWeight.bold),),
            IconButton(onPressed: (){
               final authProvider = Provider.of<AuthProvider>(context, listen: false);
               
        try {
           authProvider.logout();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Logout failed: $e")),
          );
        }
            }, icon: Icon(Icons.logout))
          ],
        ),
      ),
      body:SingleChildScrollView(
        
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                   color: const Color.fromRGBO(36, 123, 209, 1),  
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(20),
                     bottomRight: Radius.circular(20),
                  )
                ),
                height: 400,
                          
                 child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  
                  child: Column(
                    children:[
                     
                      CustomSearchBar(text: "Search",icon: Icons.search),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Text('Popular Categories',style: TextStyle(color: Colors.white,fontSize: 18),),
                        SizedBox(height: 20),
                        SizedBox(height: 100,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index)=>
                             VerticalImage(image: '', title: 'title')
                             ),
                        ),
                      ],
                      ),
                    )
                    ]
                  ),
                ),
              ),
              Padding(
              padding: EdgeInsetsGeometry.all(5.0),
                child: Column(
                            children: [
                              CarouselSlider(
                                items: [  
                                        Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                  
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset("assets/images/banner.png",  fit: BoxFit.contain)),
                              ),
                                 Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                  
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset("assets/images/banner.png",  fit: BoxFit.contain)),
                              ),
                                 Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                  
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset("assets/images/banner.png",  fit: BoxFit.contain)),
                              )
                                ],
                                 options: CarouselOptions(
                                  viewportFraction: 1.0
                                 )),
                                 SizedBox(height: 10),
                                 Center(
                                   child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 4,
                                        decoration: BoxDecoration(
                                        color: Colors.green,
                                         borderRadius: BorderRadius.circular(100)
                                        ),
                                      ),
                                      Padding(padding: EdgeInsetsGeometry.all(8)),
                                       Container(
                                        width: 20,
                                        height: 4,
                                        decoration: BoxDecoration(
                                        color: Colors.green,
                                         borderRadius: BorderRadius.circular(100)
                                        ),
                                      ),
                                                               Padding(padding: EdgeInsetsGeometry.all(8)),
                                    Container(
                                        width: 20,
                                        height: 4,
                                        decoration: BoxDecoration(
                                        color: Colors.green,
                                         borderRadius: BorderRadius.circular(100)
                                        ),
                                      ),
                                    ],
                                   ),
                                 ),
                            SizedBox(height: 20),
                            if(productProvider.errorMessage!=null)
                            productProvider.isLoading
                            ?CircularProgressIndicator()
                            :Consumer<ProductProvider>(
                              builder: (context, value, child) => 
                              GridView.builder(
                               padding: EdgeInsets.all(8),
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                               mainAxisSpacing: 16,
                               crossAxisSpacing: 16,
                               mainAxisExtent: 255
                              ),
                              itemCount: value.products.length,
                                                        
                              itemBuilder: (context, index) {
                              final product=value.products[index];
                              return
                              HomeProductCard(imagePath: product.imageUrl?? "assets/images/nike_air_max.png",
                              label: "Best seller", 
                              title: product.name?? "title", 
                              price: product.price.toString()?? "897");
                              }
                              
                                                        ),
                            )
                            ],
                          ),
                        )
            ],
          ),
        ),
        
      );
    
  }
}

class VerticalImage extends StatelessWidget {
  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTRap;
  const VerticalImage({
    required this.image,
    required this.title,
    this.textColor=Colors.white,
    this.onTRap,
    this.backgroundColor= const Color.fromARGB(255, 255, 255, 255),

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
             height: 60,
             width: 60,
            padding: EdgeInsets.all(8),
             decoration: BoxDecoration(color: Colors.white,
               borderRadius: BorderRadius.circular(100)),
                child: Center(child: Image(image: AssetImage(image),fit: BoxFit.cover,)),
                                            ),
            SizedBox(height: 5),
            SizedBox(
              width: 55,
              child: Text(title,
              style: TextStyle(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
            )
        
          ], 
        ),
      ),
    );
  }
}