import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whereisevery1/screens/home/filter/colorprovider.dart';
import 'package:whereisevery1/screens/home/filter/onboarddata.dart';
import 'package:whereisevery1/screens/home/filter/onboardpage.dart';
import 'package:whereisevery1/screens/home/filter/pageviewindicator.dart';
import 'package:whereisevery1/screens/home/home.dart';

class OnboardingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        builder: (context) => ColorProvider(),
        child: Onboarding(),
      ),
    );
  }
}


class Onboarding extends StatelessWidget{
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: onboardData.length,
          itemBuilder: (context, index) {
            return OnboardPage(
              pageController: pageController,
              pageModel: onboardData[index],
            );
          },
        ),
        Container(
          width: double.infinity,
          height: 70,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    'Filters',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30.0,
                      color: colorProvider.color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: colorProvider.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0, left: 40),
            child: PageViewIndicator(
              controller: pageController,
              itemCount: onboardData.length,
              color: colorProvider.color,
            ),
          ),
        )
      ],
    );
  }
}