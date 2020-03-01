import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final styleText = new TextStyle(fontSize: 25);
  final counter = 10;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        centerTitle: true,
        elevation: 0.4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Number of clicks', style: styleText),
            Text('$counter', style: styleText),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // counter++;
          print('Hello');
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
