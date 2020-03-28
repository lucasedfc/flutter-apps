import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroupApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titles(),
                _buttons()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.pinkAccent,
        backgroundColor: Color.fromRGBO(55, 57, 84, 1.0),
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1.0),
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0),
            title: Container()
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outlined, size: 30.0),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container()
          )
        ],
      ),
      
    );
  }

  Widget _titles() {
    return SafeArea(
            child: Container(
            padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Classify transaction', 
              style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text('Classify this transaction in a particular category',
              style: TextStyle(color: Colors.white, fontSize: 18.0))
            ],
          ),
      ),
    );
  }

  Widget _buttons() {
    return Table(
      children: [
        TableRow(
        children: [
          _createButton(Colors.blue, Icons.camera_alt, 'Camera'),
          _createButton(Colors.cyanAccent, Icons.call, 'Call')
        ]
      ),
      TableRow(
        children: [
          _createButton(Colors.deepPurple, Icons.bug_report, 'Bug'),
          _createButton(Colors.indigo, Icons.memory, 'Memory')
        ]
      ),
      TableRow(
        children: [
          _createButton(Colors.amber, Icons.tablet, 'Tablet'),
          _createButton(Colors.lightBlue, Icons.pie_chart_outlined, 'Charts')
        ]
      ),
      TableRow(
        children: [
          _createButton(Colors.teal, Icons.cloud, 'Cloud'),
          _createButton(Colors.red, Icons.mail, 'Mail')
        ]
      )
      ]);
  }

  Widget _createButton(Color color, IconData icon, String text) {
    return ClipRRect(
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color.fromRGBO(62, 66, 107, 0.7)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icon, color: Colors.white, size: 30.0),
              ),
              Text(text, style: TextStyle(color: color)),
              SizedBox(
                height: 5.0,
              )

            ],
          ),
        ),
      ),
    );
  }
}

Widget _backgroupApp() {
  final gradient = Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(52, 54, 101, 1.0),
          Color.fromRGBO(35, 37, 57, 1.0)
        ],
        begin: FractionalOffset(0.0, 0.6),
        end: FractionalOffset(0.0, 1.0)
      )
    ),
  );

  final pinkBox = Transform.rotate(
    angle: -pi / 5.0,
    child: Container(
    height: 360.0,
    width: 360.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(80.0),
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(236, 98, 188, 1.0),
          Color.fromRGBO(241, 142, 172, 1.0)
        ]
      ),
      
    ),
  ),
  );

  

  return Stack(
    children: <Widget>[
      gradient,
      Positioned(
        top: -100.0,
        child: pinkBox
        )
      
    ],
  );
}