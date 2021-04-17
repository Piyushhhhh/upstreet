import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:upstreet_flutter_code_challenge/exceptions/api_exceptions.dart';
import 'package:upstreet_flutter_code_challenge/models/albums.dart';

const API_ALBUMS_PHOTOS =
    'https://jsonplaceholder.typicode.com/albums/1/photos';

// TODO:
// Create a function for fetching data from `API_ALBUMS_PHOTOS`

class ApiService {
  static Future<List<Album>> getAlbumsPhotos() async {
    try {
      await http.get(API_ALBUMS_PHOTOS).then((response) {
        json.decode(json.encode(response.body));
        Iterable list = json.decode(response.body);
        return list.map((model) => Album.fromJson(model)).toList();
      });
    } catch (error) {
//      throw ParsingException();
    }
  }

  static Future getAlbums() {
    var url = API_ALBUMS_PHOTOS;
    return http.get(url);
  }
}
