import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';

class MapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coordinates QR'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.my_location), 
          onPressed: () {}
          )
        ],
      ),
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}