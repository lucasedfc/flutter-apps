import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pageOne(),
          _pageTwo()
        ],
      )
    );
  }

  Widget _pageOne() {
    return Center(
      child: Text('Page One'),
    );
  }

  Widget _pageTwo() {
    return Center(
      child: Text('Page Two'),
    );
  }
  
}