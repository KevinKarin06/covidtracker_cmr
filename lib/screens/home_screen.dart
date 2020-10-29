import 'dart:async';

import 'package:covid19_tracker_cmr/api/covid_service.dart';
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
  }

  CovidService service = CovidService();
  Future getD() async {
    service.getData();
  }

  @override
  void initState() {
    service.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          strokeWidth: 1,
          onRefresh: () {
            print('refresh data');
            return removePref();
          },
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Center(
                child: Text('Pull to refresh and remove prefs'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
