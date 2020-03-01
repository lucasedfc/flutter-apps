import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  final _styleText = new TextStyle(fontSize: 25);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stateful'),
          centerTitle: true,
          elevation: 0.4,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Number of clicks', style: _styleText),
            Text('$_counter', style: _styleText),
          ],
        )),
        floatingActionButton: _createButtons()
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }

  Widget _createButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      SizedBox(width: 30.0),
      FloatingActionButton(
        child: Icon(Icons.exposure_zero),
        onPressed: _reset,
      ),
      Expanded(child: SizedBox()),
      FloatingActionButton(
        child: Icon(Icons.remove),
        onPressed: _decrease,
      ),
      SizedBox(
        width: 10.0,
      ),
      FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _add,
      ),
    ]);
  }

  void _add() {
    setState(() => _counter++);
  }

  void _decrease() {
    setState(() => _counter--);
  }

  void _reset() {
    setState(() => _counter = 0);
  }
}
