import 'dart:math';

import 'package:covid19_tracker_cmr/api/covid_service.dart';
import 'package:covid19_tracker_cmr/model/covid19.dart';
import 'package:covid19_tracker_cmr/screens/error_screen.dart';
import 'package:covid19_tracker_cmr/utils/constants.dart';
import 'package:covid19_tracker_cmr/widgets/custom_container.dart';
import 'package:covid19_tracker_cmr/widgets/card_one.dart';
import 'package:covid19_tracker_cmr/widgets/card_two.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OverView extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  Future<void> removePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('seen');
  }

  Future<Covid19> _future;
  Future<Covid19> _covid19;

  /* 
       ALWAYS HAD  BAD TIME WITH FUTURE BUILDER WHICH KEEPS REBUILDNG 
       Though i still don't get it well but i always rember to pass the actual 
       future to the future parameter of the future builder but instead the
       result of the future.As passing the actual future will cause the request 
       to run again each time the widgets rebuilbs (ie when the setstate 
       method is called). 
   */

  Future<Covid19> _fetch({bool refresh = false}) async {
    CovidService service = CovidService();
    print('refresh call with $refresh');
    return await service.getData(refresh: refresh);
  }

  void _load() {
    print('laod function called');
    _covid19 = _fetch(refresh: true);
    setState(() {
      _future = _covid19;
    });
  }

  @override
  void initState() {
    print('init State Called');
    _future = _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ran = Random().nextInt(1000);
    print('This is $ran');
    print('Widget rebuild !');
    return RefreshIndicator(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<Covid19>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Covid19 covid = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyContainer(
                          backgrounColor: confirmedBackgroundColor,
                          textColor: confirmedText,
                          value: covid.confirmed,
                          text: 'Confirmed',
                        ),
                        MyContainer(
                          text: 'Active',
                          backgrounColor: activeBackgroundColor,
                          textColor: activeText,
                          value: covid.active,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyContainer(
                          text: 'Recovered',
                          backgrounColor: recoverdBackgroundcolor,
                          textColor: recoveredText,
                          value: covid.recovered,
                        ),
                        MyContainer(
                          text: 'Deceased',
                          backgrounColor: deathBackgroundColor,
                          textColor: deathsText,
                          value: covid.deaths,
                        ),
                      ],
                    ),
                    CardOne(),
                    CardTwo(),
                    Text(covid.date.toString()),
                  ],
                );
              } else if (snapshot.hasError) {
                return ErrorScreen();
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ),
      ),
      onRefresh: () {
        print('onRefresh method called!');
        //removePref();
        return Future.delayed(Duration(milliseconds: 1000), () {
          _load();
        });
      },
    );
  }
}
