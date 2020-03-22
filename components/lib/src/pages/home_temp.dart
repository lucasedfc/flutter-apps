import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(children: _createItemsShort()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      list
        ..add(tempWidget)
        ..add(Divider(
          color: Colors.blue,
        ));
    }
    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((item) {

      return Column(
        children: <Widget>[
          ListTile(
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_right),
            title: Text(item + '!'),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();

  }
}
