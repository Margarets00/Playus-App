import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:playus_app/constants.dart';

class ListSearchView extends StatefulWidget {
  final List<dynamic> ytResult = [];
  ListSearchView(ytResult);
  @override
  _ListSearchView createState() => _ListSearchView(ytResult);
}

class _ListSearchView extends State<ListSearchView> {
  final List<dynamic> ytResult = [];
  _ListSearchView(ytResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Background(
            width: 1,
            where: 'bottom',
            height: 0.89,
          ),
          Navigation(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: []))
        ]));
  }
}
