import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie_model.dart';

class MovieDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(child: Text('Detail page ${movie.title}')),
    );
  }
}