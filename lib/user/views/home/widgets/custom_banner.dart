import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
   final TextEditingController controller;
  final Function(String) onChanged;

    const BannerSection({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(36, 123, 209, 1),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
         bottomRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
            CustomSearchBar(
              controller: controller,
              hintText: "Search",
              onChanged: onChanged,
               icon: Icons.search),
          const SizedBox(height: 20),
          CarouselSlider(
            items: List.generate(
              3,
              (index) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/banner.png",
                 fit: BoxFit.contain, width: double.infinity),
              ),
            ),
            options: CarouselOptions(viewportFraction: 1.0,
             autoPlay: true,
              height: 150),
          ),
        ],
      ),
    );
  }
}