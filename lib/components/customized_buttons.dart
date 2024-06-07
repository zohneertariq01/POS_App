import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: hoverColor,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        hintStyle: TextStyle(fontSize: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: hoverColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: hoverColor, width: 2.0),
        ),
      ),
      onSubmitted: (String value) {
        debugPrint(value);
      },
    );
  }
}

class CustomizeTextField extends StatelessWidget {
  final String hintText;
  final Color colors;
  final TextEditingController controller;

  const CustomizeTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: hoverColor,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle: TextStyle(color: colors),
        contentPadding: EdgeInsets.all(21),
        hintStyle: TextStyle(fontSize: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      onSubmitted: (String value) {
        debugPrint(value);
      },
    );
  }
}

class CustomizedTextField extends StatelessWidget {
  final String hintText;
  final Color colors;
  final TextEditingController controller;

  const CustomizedTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: hoverColor,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle: TextStyle(color: colors),
        contentPadding: EdgeInsets.all(21),
        hintStyle: TextStyle(fontSize: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      onSubmitted: (String value) {
        debugPrint(value);
      },
    );
  }
}

class PrivacyText extends StatelessWidget {
  final String title, text;
  const PrivacyText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.0,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 6.0),
      ],
    );
  }
}
