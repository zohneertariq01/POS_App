import 'package:flutter/material.dart';

class OurData extends StatelessWidget {
  final String title;
  final String image;
  final String content;
  const OurData({
    super.key,
    required this.title,
    required this.image,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          height: 280.0,
          width: width * 0.8,
          image: AssetImage(image),
        ),
        SizedBox(height: 18.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF2E384D),
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.0),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
