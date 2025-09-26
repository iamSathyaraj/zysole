import 'package:e_commerce/widgets/common/rounded_image.dart';
import 'package:flutter/material.dart';

class HomeProductCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final String title;
  final String price;

  const HomeProductCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFavourite=false;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedImage(
                height: 130,
                backgroundColor: Colors.white,
                 imageUrl: imagePath,fit: BoxFit.contain,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 1,
          right: 2,
          child: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add, color: Colors.white, size: 20),
              onPressed: () {
              
              },
            ),
          ),
        
        ),
        IconButton(onPressed: (){
          
        }, icon: Icon(isFavourite ? Icons.favorite: Icons.favorite_border)),
     
      ],
    );
  }
}
