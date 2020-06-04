import 'package:flutter/material.dart';

class OnboardingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Stack(
            children: <Widget>[
          Positioned(
            top: 100,
            bottom: 450,
            left: 10,
            right: 200,
            child: FlatButton(
              onPressed: () {},
              child: Container(
                color: Colors.lime,
              ),
            ),
          ),
              Positioned(
                top: 200,
                bottom: 450,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                bottom: 350,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                bottom: 350,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                bottom: 250,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.orange,
                  ),
                ),
              ),Positioned(
                top: 400,
                bottom: 250,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
              Positioned(
                top: 400,
                bottom: 150,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),Positioned(
                top: 500,
                bottom: 150,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.tealAccent,
                  ),
                ),
              ),
              Positioned(
                top: 500,
                bottom: 50,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ),Positioned(
                top: 600,
                bottom: 50,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              Positioned(
                top: 620,
                bottom: 10,
                left: 300,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                bottom: 500,
                left: 200,
                right: 10,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
              ),Positioned(
                top: 20,
                bottom: 600,
                left: 10,
                right: 200,
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
          ],
        ),
        ),
      ),
    );
  }
}
