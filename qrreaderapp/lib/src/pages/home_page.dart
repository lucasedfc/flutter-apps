
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/pages/addresses_page.dart';
import 'package:qrreaderapp/src/pages/maps_page.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qrreaderapp/src/utils/scans_utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: scansBloc.deleteAllScans
            )
        ],
      ),
      body: _loadPage(currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _scanQR
        ),
    );
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex, 
      onTap: (index) {
        setState(() {
        currentIndex = index;
        });
      }, 
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
      BottomNavigationBarItem(icon: Icon(Icons.brightness_5), title: Text('Address'))
    ]);
  }

  Widget _loadPage(int actualPage) {

    switch (actualPage) {
      case 0:
        return MapsPage();
        break;
      case 1:
        return AddressesPage();
        break;
      default:
        return MapsPage();
    }
  }

   _scanQR() async {

     // https://merlindataquality.com
     // geo:-34.568600038713754,-58.483997730816704

  String futureString = 'https://www.merlindataquality.com';

    //  try {
    //     futureString = await BarcodeScanner.scan();
    //  } catch(e) {
    //    futureString = e.toString();
    //  }

    if(futureString != null) {
      final scan = ScanModel( value: futureString);
      scansBloc.addScan(scan);

      final scan2 = ScanModel( value: 'geo:-34.568600038713754,-58.483997730816704');
      scansBloc.addScan(scan2);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.openScan(scan);
        });
      } else {
        print('Its not IOs');
        utils.openScan(scan);
      }

    }
  }

}
