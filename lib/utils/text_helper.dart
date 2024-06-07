import 'package:flutter/material.dart';

class TextHelper {
  Text mNormalText({required text, required color, required size}) {
    return Text(text, style: mNormalTextStyle(color: color, size: size));
  }

  TextStyle mNormalTextStyle({required color, required size}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }
}
