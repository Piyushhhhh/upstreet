import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/models/albums.dart';
import 'package:upstreet_flutter_code_challenge/services/api.dart';

import '../services/api.dart';

// TODO:
// 1. Create a list view to display the album data from the fetching function in `api.dart`
// 2. The item of the list should contain the album's thumbnail and title

class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  var albums = new List<Album>();

  _getUsers() {
    ApiService.getAlbums().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        albums = list.map((model) => Album.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album List'),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return ListTile(
//              leading: CircleAvatar(
//                backgroundImage: Image.network(
//                    src), // no matter how big it is, it won't overflow
//              ),
              title: Text(albums[index].title));
        },
      ),
    );
  }
}
