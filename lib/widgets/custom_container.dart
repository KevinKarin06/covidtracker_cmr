import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color backgrounColor, textColor;
  final String text;
  final int value;

  const MyContainer({
    this.backgrounColor,
    this.textColor,
    this.text,
    this.value,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.20;
    double _width = MediaQuery.of(context).size.width * 0.40;
    return Container(
      padding: EdgeInsets.all(15.0),
      height: _height,
      width: _width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: this.backgrounColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.text,
            style: TextStyle(
              color: this.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              this.value.toString(),
              style: TextStyle(
                color: this.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
