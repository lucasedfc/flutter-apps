import 'package:flutter/material.dart';
import 'package:movie_app/src/providers/movie_provider.dart';
import 'package:movie_app/src/widgets/card_swiper_widget.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies on Cinema'),
        backgroundColor: Colors.indigoAccent,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {}
          )
        ],
      ),
      body: Container(
        child: Column(children: <Widget>[
          _swiperCard()
        ],),
      ),
    );
  }

  Widget _swiperCard() {

    final moviesProvider = MovieProvider();
    moviesProvider.getNowPlaying();
    
     return CardSwiper(
      movies: [1,2,3,4,5],
    ); 
    
  }
}
