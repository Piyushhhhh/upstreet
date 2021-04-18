import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/constants/strings.dart';
import 'package:upstreet_flutter_code_challenge/models/albums.dart';
import 'package:upstreet_flutter_code_challenge/screens/album_list.dart';
import 'package:upstreet_flutter_code_challenge/services/api_service.dart';

class AddEditAlbum extends StatefulWidget {
  final bool fromAddButton;
  final Album album;
  final int albumLength;

  AddEditAlbum({this.fromAddButton = true, this.album, this.albumLength});

  @override
  _AddEditAlbumState createState() => _AddEditAlbumState();
}

class _AddEditAlbumState extends State<AddEditAlbum> {
  final TextEditingController _albumCoverController;
  final TextEditingController _albumTitleController;

  _AddEditAlbumState()
      : _albumCoverController = TextEditingController(),
        _albumTitleController = TextEditingController();

  @override
  void initState() {
    if (widget.fromAddButton == false) {
      _albumCoverController.text = widget.album.thumbnailUrl;
      _albumTitleController.text = widget.album.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.fromAddButton
            ? Text(Strings.newAlbum)
            : Text('id: ' + widget.album.id.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.00),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: _albumCoverController,
                decoration: InputDecoration(
                  labelText: Strings.albumCover + " *",
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) return '';

                  return null;
                },
                onSaved: (String value) {},
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.00),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: _albumTitleController,
                decoration: InputDecoration(
                  labelText: Strings.albumTitle + " *",
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) return '';

                  return null;
                },
                onSaved: (String value) {},
                keyboardType: TextInputType.text,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {
          widget.fromAddButton
              ? ApiService.editAlbum(
                  widget.albumLength + 1,
                  _albumTitleController.text,
                  _albumCoverController.text,
                  _albumCoverController.text)
              : ApiService.editAlbum(
                  widget.album.id,
                  _albumTitleController.text,
                  _albumCoverController.text,
                  _albumCoverController.text);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumList(),
            ),
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }
}
