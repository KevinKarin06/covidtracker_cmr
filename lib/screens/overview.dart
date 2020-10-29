import 'package:covid19_tracker_cmr/api/covid_service.dart';
import 'package:covid19_tracker_cmr/model/covid19.dart';
import 'package:covid19_tracker_cmr/utils/Constants.dart';
import 'package:covid19_tracker_cmr/widgets/CustomContainer.dart';
import 'package:covid19_tracker_cmr/widgets/card_one.dart';
import 'package:covid19_tracker_cmr/widgets/card_two.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OverView extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  Future removePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('seen');
  }

  Future<Covid19> covid19;
  CovidService service = CovidService();
  @override
  void initState() {
    covid19 = service.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Widget rebuild !');
    return RefreshIndicator(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.red,
          child: FutureBuilder(
              future: service.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Covid19 covid = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }),
        ),
      ),
      onRefresh: () {
        setState(() {});
        return service.getData();
      },
    );
  }
}
