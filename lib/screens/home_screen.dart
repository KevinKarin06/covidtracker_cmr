import 'package:covid19_tracker_cmr/screens/overview.dart';
import 'package:covid19_tracker_cmr/screens/preventions.dart';
import 'package:covid19_tracker_cmr/screens/symtoms.dart';
import 'package:covid19_tracker_cmr/widgets/custom_bottom_nav.dart';
import 'package:covid19_tracker_cmr/widgets/show_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> list = [OverView(), Symtoms(), Preventions()];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Covid19 Tracker'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.contact_support_outlined,
            ),
            onPressed: () {
              var about = ShowAlertDialog();
              showDialog(context: context, builder: (context) => about);
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        children: [
          CustomBottomNavigationItem(
            iconPath: 'assets/icons/house-user-solid.svg',
            label: 'Home',
          ),
          CustomBottomNavigationItem(
            iconPath: 'assets/icons/head-side-cough-solid.svg',
            label: 'Symtoms',
          ),
          CustomBottomNavigationItem(
            iconPath: 'assets/icons/head-side-mask-solid.svg',
            label: 'Preventions',
          ),
        ],
        onChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: IndexedStack(
          children: [
            for (final tabItem in list) tabItem,
          ],
          index: _currentIndex,
        ),
      ),
    );
  }
}
