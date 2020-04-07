import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/providers/db_provider.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScanModel>>(
      future: DBProvider.db.getAllScans(),
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if( !snapshot.hasData) {
          return Center(
            child: Text('No data available'),
          );
        }

        final scans = snapshot.data;

      
        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, i) => Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (direction) => DBProvider.db.deleteScan(scans[i].id),
              child: ListTile(
              leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor),
              title: Text(scans[i].value),
              subtitle: Text('ID: ${scans[i].id}'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            ),
          )
          );
      },
    );
  }
}
