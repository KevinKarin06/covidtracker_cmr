import 'package:covid19_tracker_cmr/screens/preventions.dart';
import 'package:covid19_tracker_cmr/utils/Constants.dart';
import 'package:flutter/material.dart';

class CardTwo extends StatelessWidget {
  const CardTwo({
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
            top: 5,
            left: 5,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Follow doctor\'s tips and \n recommendations  to fight \n against the COVID-19',
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_sharp,
                        color: blueBackground,
                        size: 18,
                      ),
                      onPressed: () {
                        print('bnt pressed');
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
