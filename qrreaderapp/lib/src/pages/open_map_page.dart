import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Coordinates QR'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.my_location), onPressed: () {})
          ],
        ),
        body: _createFlutterMap(scan));
  }

  Widget _createFlutterMap(ScanModel scan) {
    return FlutterMap(
      options: MapOptions(center: scan.getLatLng(), zoom: 15),
      layers: [
        _createMap(),
        _createMarker(scan)
      ],
    );
  }

  _createMap() {
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoibHVjYXNlZGZjIiwiYSI6ImNrOHQ1amlwdzAyMTgzZ281NHNkMmZic2EifQ.eUAu7igZRLbPUAfw-NNYSw',
        'id': 'mapbox.streets' // streets, dark, light, sattelite, outdoors
      }
    );
  }

   _createMarker(ScanModel scan) {
     return MarkerLayerOptions(
       markers: <Marker> [
         Marker(
           width: 100.0,
           height: 100.0,
           point: scan.getLatLng(),
           builder: (context) => Container(child: Icon(Icons.location_on, size: 45.0, color: Colors.redAccent))
         )
       ]
     );
  }
}
