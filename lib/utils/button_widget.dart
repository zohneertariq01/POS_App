import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  var backgroundColor;
  final width, height;
  final icons;

  ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      this.backgroundColor,
      required this.icons,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClicked,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: backgroundColor != null ? backgroundColor : hoverColor,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      );
}
