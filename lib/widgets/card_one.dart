import 'package:covid19_tracker_cmr/utils/Constants.dart';
import 'package:flutter/material.dart';

class CardOne extends StatelessWidget {
  const CardOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: blueBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            right: 10,
            top: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stay Home',
                    style: cardTextStyle,
                  ),
                  Text(
                    'Stay Safe',
                    style: cardTextStyle,
                  ),
                  Text(
                    'Save Lives',
                    style: cardTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
