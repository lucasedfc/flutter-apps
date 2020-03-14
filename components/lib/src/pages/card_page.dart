import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 30.0),
          _cardType2(),
        ],
      ),
    );
  }
}

Widget _cardType2() {
  return Card(
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/2/2c/NZ_Landscape_from_the_van.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit: BoxFit.cover,
        ),
        /* Image(
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/2/2c/NZ_Landscape_from_the_van.jpg'),
        ), */
        Container(
            padding: EdgeInsets.all(10.0), child: Text('Subtitle of the image'))
      ],
    ),
  );
}

Widget _cardType1() {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Card Title'),
          subtitle: Text('This is a description for the flutter card'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {},
            )
          ],
        )
      ],
    ),
  );
}
