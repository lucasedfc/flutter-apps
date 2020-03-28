
import 'package:flutter/material.dart';
import 'package:movie_app/src/models/movie_model.dart';

class MovieVertical extends StatelessWidget {
  final List<Movie> movies;
  
  MovieVertical({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final _pageController = new PageController(
       initialPage: 1,
       viewportFraction: 0.3
    );


    return Container(
        height: _screenSize.height.toDouble() * 2.0,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          pageSnapping: false,
          controller: _pageController,
          itemCount: movies.length,
          itemBuilder: (context, i) => _card(context, movies[i])),
          // children: _cards(context))
          );
  }

  Widget _card(BuildContext context,Movie movie) {
    
    final _screenSize = MediaQuery.of(context).size;

    movie.uniqueId = UniqueKey().toString();

    final movieCard = Container(
        child: Column(
          children: <Widget>[
            Hero(
              tag: movie.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(
                    movie.getPosterImg(),
                  ),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height:_screenSize.height.toDouble() * 0.50,
                ),
              ),
            ),
            Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle)
          ],
        ),
      );

      return GestureDetector(
        child: movieCard,
        onTap: ( ) {
          Navigator.pushNamed(context, 'detail', arguments: movie);
        },
      );
  }
}