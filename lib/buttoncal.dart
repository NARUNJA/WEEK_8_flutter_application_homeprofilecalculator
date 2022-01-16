import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  MyButton(
      {this.color, this.textColor, this.buttonText = '', this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped, //ปุ่มกด
      child: Padding(
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          // ทำปุ่มเหลี่ยมมน
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                // อักษรบนปุ่ม
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
