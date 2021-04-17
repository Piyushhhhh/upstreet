import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/models/albums.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  AlbumDetails(this.album);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('id: ' + album.id.toString()),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.network("${album.thumbnailUrl}"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                width: double.infinity,
                child: Text(
                  album.title,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
