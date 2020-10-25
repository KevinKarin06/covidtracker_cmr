import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future removePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('seen');
    print('Prefs cleared');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                removePref();
              },
              child: Text('Clear Preferences'),
            )
          ],
        ),
      ),
    );
  }
}
