import 'package:covid19_tracker_cmr/utils/constants.dart';
import 'package:flutter/material.dart';

class CardTwo extends StatelessWidget {
  const CardTwo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * 0.20;
    return Container(
      height: _height,
      decoration: BoxDecoration(
        color: blueBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            top: -16,
            right: 10,
            child: Container(
              height: _height + 35,
              width: 100,
              child: Image.asset(
                'assets/images/doc.png',
              ),
            ),
          ),
          Positioned(
            left: 10,
            child: Container(
              height: _height,
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Follow doctor\'s tips and \nrecommendations  to fight \nagainst the COVID-19.',
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
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
