import 'dart:convert';

import 'package:movie_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String _api_key = '67e526574227c0660c9af6e76aff122b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> _processData(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _api_key, 'language': _language});

    return await _processData(url);
  }

  Future<List<Movie>> getPopular() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _api_key,
      'language': _language
    });

    return await _processData(url);
  }
}
