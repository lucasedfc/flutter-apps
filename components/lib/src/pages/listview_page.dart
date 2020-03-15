import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _lastImage = 0;

  @override
  void initState() {
    super.initState();

    _addImages();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _addImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Lists')
       ),
       body: _createList(),
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
    }
    );
  }

  _addImages() {
    for(var i = 1; i < 10; i++) {
    _lastImage++;
    _listNumbers.add(_lastImage);
    }

    setState(() {
      
    });
  }
}