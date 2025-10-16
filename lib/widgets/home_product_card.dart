  import 'package:flutter/material.dart';

  class HomeProductCard extends StatelessWidget {
    final String? imageUrl;
    final String label;
    final String title;
    final double price;
    final bool isFavourite;
    final VoidCallback onFavouriteTap;
    final VoidCallback onAddTap;

    const HomeProductCard ({
      Key? key,
      required this.imageUrl,
      required this.label,
      required this.title,
      required this.price,
      required this.isFavourite,
      required this.onFavouriteTap,
      required this.onAddTap,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          width: 150, 
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  // Container(
                  //   height: 45,
                  //   decoration: const BoxDecoration(
                  //     color: Color(0xff2575fc),
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(20),
                  //       topRight: Radius.circular(20)
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: double.infinity,
                    // color: const Color.fromARGB(255, 239, 202, 202),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                      child: 
                      (imageUrl!.isNotEmpty)?
                                 
                      ClipRRect(
                        child: Image.network(imageUrl!,
                        fit: BoxFit.cover,
                         height: 90,width: double.infinity),
                      ):
                                     
                      Icon(Icons.image_not_supported, size: 70, color: Colors.grey),
                    
                    
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      label,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: onFavouriteTap,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.redAccent,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Material(
                  color: Color.fromARGB(255, 91, 146, 241),
                  shape: const CircleBorder(),
                  child: InkWell(
                    onTap: onAddTap,
                    borderRadius: BorderRadius.circular(30),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(Icons.add, color: Colors.white, size: 22),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

