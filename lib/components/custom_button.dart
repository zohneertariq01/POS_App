import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'neumorphic_button.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.press,
    required this.width,
    required this.height,
    required this.label,
    required this.isIcon,
  });

  final bool isIcon;
  final String label;
  final double width, height;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onTap: press,
      bottomRightShadowBlurRadius: 15,
      bottomRightShadowSpreadRadius: 1,
      borderWidth: 5,
      backgroundColor: Colors.grey.shade500,
      topLeftShadowBlurRadius: 15,
      topLeftShadowSpreadRadius: 1,
      topLeftShadowColor: Colors.black,
      bottomRightShadowColor: Colors.grey.shade500,
      height: height,
      padding: EdgeInsets.zero,
      width: width,
      bottomRightOffset: const Offset(4, 4),
      topLeftOffset: const Offset(-4, -4),
      child: const Center(
          child: Text("Add New", style: TextStyle(color: Colors.black))),
    );
  }
}
