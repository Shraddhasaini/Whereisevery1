import 'package:flutter/material.dart';
import 'package:whereisevery1/screens/home/filter/screen/bt.dart';
import 'package:whereisevery1/screens/home/filter/screen/opl.dart';
import 'package:whereisevery1/screens/home/filter/screen/osl.dart';
import 'package:whereisevery1/screens/home/filter/screen/wfh.dart';
import 'package:whereisevery1/screens/home/filter/screen/wio.dart';


class PageViewFilter extends StatefulWidget {

  @override
  _PageViewFilterState createState() => _PageViewFilterState();
}

class _PageViewFilterState extends State<PageViewFilter> {

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        pageSnapping: true,
        controller: pageController,
        children: <Widget>[
          WorkFromHome(),
          WorkingInOffice(),
          OnPlannedLeave(),
          OnSickLeave(),
          BusinessTravel(),

        ],
      ),
    );
  }
}
