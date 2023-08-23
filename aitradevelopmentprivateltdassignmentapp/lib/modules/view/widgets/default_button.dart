import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/core/font_sizes.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onTap;
  final double height;
  final double width;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final double borderRadius;

  const DefaultButton({
    super.key, 
    this.onTap, 
    required this.height, 
    required this.width, 
    required this.buttonText, 
    this.buttonColor = primaryColor, 
    this.buttonTextColor = Colors.white,
    this.borderRadius = 30
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
          child: Center(
            child: Text(
              buttonText,
              style: buttonLg(color: buttonTextColor),
            ),
          ),
        ),
      );
  }
}