import 'package:e_commerce/user/views/home_screen.dart';
import 'package:flutter/material.dart';

class PopularCategoriesSection extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'image': 'assets/images/shoes.png', 'title': 'Nike'},
    {'image': 'assets/images/clothes.png', 'title': 'Adidas'},
    {'image': 'assets/images/accessories.png', 'title': 'puma'},
    {'image': 'assets/images/sports.png', 'title': 'Sports'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text('Popular Categories',
             style: TextStyle(color: Colors.black87,
              fontSize: 18)),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];
                
                return VerticalCategoryCard(
                  image: category['image']!,
                   title: category['title']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}