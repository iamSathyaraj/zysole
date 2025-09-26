import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final Color? borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  const RoundedContainer({super.key,
  this.width,
  this. height,
  this.radius=15,
  this.backgroundColor=Colors.white,
  this.borderColor,
  this.padding


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,

      height: height,
      padding: padding,
    );
  }
}