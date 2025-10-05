
import 'package:flutter/material.dart';

class FavouriteScreenUI extends StatelessWidget {
  final List<Map<String, dynamic>> shoes = [
    {
      'name': 'Nike Jordan',
      'price': '58.7',
      'image': 'assets/jordan.png',
      'colors': [Colors.yellow, Colors.green.shade200],
      'favorite': true,
    },
    {
      'name': 'Nike Air Max',
      'price': '37.8',
      'image': 'assets/airmax.png',
      'colors': [Colors.blue.shade200, Colors.blueGrey.shade900],
      'favorite': false,
    },
    {
      'name': 'Nike Club Max',
      'price': '47.7',
      'image': 'assets/clubmax.png',
      'colors': [Colors.blue.shade900, Colors.yellow.shade600],
      'favorite': false,
    },
    {
      'name': 'Nike Air Max',
      'price': '57.6',
      'image': 'assets/airmax2.png',
      'colors': [Colors.blue.shade400, Colors.blue.shade900],
      'favorite': false,
    },
     {
      'name': 'Nike Air Max',
      'price': '57.6',
      'image': 'assets/airmax2.png',
      'colors': [Colors.blue.shade400, Colors.blue.shade900],
      'favorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 241, 243),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        title: Text(
          'Favourite',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite_border, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
          children: shoes.map((shoe) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      shoe['favorite'] ? Icons.favorite : Icons.favorite_border,
                      color: shoe['favorite'] ? Colors.red : Colors.black,
                    ),
                  ),
                  SizedBox(height: 6),
                  Center(
                    child: Image.asset(
                      shoe['image'],
                      height: 64,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'BEST SELLER',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    shoe['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${shoe['price']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: shoe['colors'].map<Widget>((color) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }
                    ).toList(),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}