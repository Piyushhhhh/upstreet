import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/constants/strings.dart';
import 'package:upstreet_flutter_code_challenge/models/albums.dart';
import 'package:upstreet_flutter_code_challenge/screens/add_edit_album.dart';
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
  bool isLoading = true;

  _initAlbum() {
    ApiService.getAlbumsPhotos().then((List<Album> albums) {
      setState(() {
        isLoading = false;
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (albums == null || albums.isEmpty)
              ? Center(
                  child: Text(Strings.noAlbumsFound),
                )
              : ListView.separated(
                  itemCount: albums.length,
                  separatorBuilder: (_,__)=>SizedBox(height: 8,),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network("${albums[index].thumbnailUrl}"),
                      title: Text(albums[index].title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AlbumDetails(album:albums[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditAlbum(),
            ),
          );
        },
      ),
    );
  }
}
