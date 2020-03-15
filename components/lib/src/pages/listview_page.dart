import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastImage = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _addImages();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _addImages();

        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lists')),
      body: Stack(
        children: <Widget>[
      _createList(),
      _createLoading()

        ],
      )

    );
  }

  Widget _createList() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNumbers[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$image/500/400'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        });
  }

  _addImages() {
    for (var i = 1; i < 10; i++) {
      _lastImage++;
      _listNumbers.add(_lastImage);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    final duration = new Duration(seconds: 2);
    setState(() {
      return new Timer(duration, httpResponse);
    });
  }

  void httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: new Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn);

    _addImages();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {

if(_isLoading) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    CircularProgressIndicator()
  ],
  ),
  SizedBox(height: 15.0)
  ]);
} else {
  return Container();
}
  }
}
