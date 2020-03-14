import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTeYYvjoQAeiiqJnxAgG-0eQIxEuPTzFd7YYNPCBfhCzBZ82IeJ'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('IS'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://rosarioplus.com/__export/1516192369499/sites/rosarioplus/img/2018/01/17/indio_solari_cumpleaxos_69_crop1516192368840.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
