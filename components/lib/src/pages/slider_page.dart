import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValue = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: <Widget>[
          _createSlider(),
          Expanded(child: _createImage())
        ],),
        ),
    );
  }

  Widget _createSlider() {
return Slider(
  activeColor: Colors.indigo,
  label: 'Image size',
  // divisions: 20,
  value: _sliderValue,
  min: 10.0,
  max: 400.0,
  onChanged: ( value ) {
    setState(() {
      _sliderValue = value.roundToDouble();
      
    });
  },
);
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage('https://as01.epimg.net/meristation/imagenes/2018/07/13/header_image/851294041531472361.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
      );
  }
}