import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onpressed;
  final double radius;

  const RoundedImage({
    super.key,  
    this.width,
    this.height,
    this.border,
    this.applyImageRadius = true,
    required this.backgroundColor,
    this.fit = BoxFit.contain,
    required this.imageUrl,
    this.padding,
    this.onpressed,
    this.radius = 14

    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.asset(imageUrl,fit: fit),
        ),
      ),
    );
  }
}