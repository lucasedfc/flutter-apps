import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Image(
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg'),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lago con un puente', style: titleStyle),
                    SizedBox(height: 7.0),
                    Text(
                      'Colinas en alemania',
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
              Icon(Icons.star, color: Colors.red, size: 30.0),
              Text('41', style: TextStyle(fontSize: 30.0))
            ],
          ),
        )
      ],
    ));
  }
}
