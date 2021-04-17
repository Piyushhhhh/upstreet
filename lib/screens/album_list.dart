import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/constants/strings.dart';
import 'package:upstreet_flutter_code_challenge/models/albums.dart';
import 'package:upstreet_flutter_code_challenge/screens/album_detail.dart';
import 'package:upstreet_flutter_code_challenge/services/api_service.dart';

import '../models/albums.dart';
import '../services/api_service.dart';

// TODO:
// 1. Create a list view to display the album data from the fetching function in `api_service.dart`
// 2. The item of the list should contain the album's thumbnail and title

class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<Album> albums;
  bool loading = true;

  _initAlbum() {
    ApiService.getAlbumsPhotos().then((List<Album> albums) {
      setState(() {
        loading = false;
        this.albums = albums;
      });
    }).catchError((error) {
      print(error);
    });
  }

  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.albumList),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (albums == null || albums.isEmpty)
              ? Center(
                  child: Text(Strings.noAlbumsFound),
                )
              : ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: ListTile(
                        leading: Image.network("${albums[index].thumbnailUrl}"),
                        title: Text(albums[index].title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlbumDetails(albums[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
