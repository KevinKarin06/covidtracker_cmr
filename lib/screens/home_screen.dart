import 'package:covid19_tracker_cmr/screens/overview.dart';
import 'package:covid19_tracker_cmr/screens/preventions.dart';
import 'package:covid19_tracker_cmr/screens/symtoms.dart';
import 'package:covid19_tracker_cmr/widgets/custom_bottom_nav.dart';
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        children: [
          CustomBottomNavigationItem(icon: Icons.home, label: 'Home'),
          CustomBottomNavigationItem(icon: Icons.home, label: 'Symtoms'),
          CustomBottomNavigationItem(icon: Icons.home, label: 'Preventions'),
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
