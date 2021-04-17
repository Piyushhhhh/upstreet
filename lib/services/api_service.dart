import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:upstreet_flutter_code_challenge/exceptions/api_exceptions.dart';
import 'package:upstreet_flutter_code_challenge/models/albums.dart';

import '../models/albums.dart';

const API_ALBUMS_PHOTOS =
    'https://jsonplaceholder.typicode.com/albums/1/photos';

// TODO:
// Create a function for fetching data from `API_ALBUMS_PHOTOS`

class ApiService {
  static Future<List<Album>> getAlbumsPhotos() async {
    var completer = new Completer<List<Album>>();
    try {
      await http.get(API_ALBUMS_PHOTOS).then((response) {
        json.decode(json.encode(response.body));
        Iterable list = json.decode(response.body);
        List<Album> albums =
            list.map((model) => Album.fromJson(model)).toList();
        print('a');
        completer.complete(albums);
      });
    } catch (error) {
      print('b');

      completer
          .completeError(ParsingException("Parsing failed at getAlbumPhotos"));
    }
    return completer.future;
  }
}
