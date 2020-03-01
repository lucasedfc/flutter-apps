import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(children: _createItems()),
    );
  }

  List<Widget> _createItems() {

    List<Widget> list = new List<Widget>();

    for (String opt in options) {

      final tempWidget = ListTile(
        title: Text(opt),
      );

      list..add(tempWidget)
          ..add(Divider(color: Colors.blue,
      ));
    }
    return list;
  }

  List<Widget> createItemsShort() {
    
  }
}
