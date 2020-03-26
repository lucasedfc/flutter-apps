import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _createImage(),
        _createTitle(),
        _createAction(),
        _createText(),
        _createText(),
        _createText()
        ],
    ));
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg'),
    );
  }

  Widget _createTitle() {
    return Container(
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
    );
  }

  Widget _createAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _action(Icons.call, 'CALL'),
        _action(Icons.near_me, 'ROUTE'),
        _action(Icons.share, 'SHARE')
      ],
    );
  }

  Widget _action(IconData icon, String text) {
    return Column(
          children: <Widget>[
            Icon(icon, color: Colors.blue, size: 40.0),
            SizedBox(height: 5.0),
            Text(text, style: TextStyle(fontSize: 15.0, color: Colors.blue))
          ],
        );
  }

  Widget _createText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Text(
        'Ex mollit officia eu nostrud ea aliqua laboris nostrud sint. Irure ut enim laboris cupidatat amet ipsum anim amet. Ullamco mollit id qui ea cillum. Quis commodo quis aliqua dolore ea deserunt commodo anim consequat nostrud.',
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.justify,
      ),
      
    );
  }
}
