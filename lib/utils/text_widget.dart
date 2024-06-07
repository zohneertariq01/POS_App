import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool isBold;

  const TextWidget({
    required this.text,
    required this.color,
    required this.size,
    required this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
