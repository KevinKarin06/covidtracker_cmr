import 'package:covid19_tracker_cmr/screens/home_screen.dart';
import 'package:covid19_tracker_cmr/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  final SharedPreferences prefs;
  IntroScreen({this.prefs});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Image.asset(
            'assets/images/intro_image.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stay Home, Stay Safe, Save Lives',
              style: introMainText,
            ),
            Text(
              'Welcome to COVID-19 information portal of Cameroon',
              style: introSubText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'GET STARTED',
                  style: introBtnText,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: red,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_sharp,
                      color: white,
                      size: 20,
                    ),
                    onPressed: () {
                      this.prefs.setBool('seen', true);
                      print(this.prefs.getBool('seen'));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
