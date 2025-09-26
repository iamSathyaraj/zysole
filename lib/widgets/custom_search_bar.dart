import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String text;
  final IconData icon;
  // final Function void onTap;
  const CustomSearchBar({
    required this.text,
    required this.icon, 
    // this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Icon(icon,color: const Color.fromARGB(255, 68, 67, 67)),
              SizedBox(width: 10),
              Text(text, style: TextStyle(),)
            ],
          ),
        ),
      ),
    );
  }
}