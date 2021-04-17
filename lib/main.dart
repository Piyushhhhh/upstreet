import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/constants/app_color.dart';
import 'package:upstreet_flutter_code_challenge/constants/strings.dart';

import './screens/album_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AlbumList(),
    );
  }
}
