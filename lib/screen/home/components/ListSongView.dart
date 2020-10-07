import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class Song_API {
  String song_url; //노래 정보
  String username; //신청자 정보
  bool isPlaying; //현재 재생중인가?
}

class ListSongView extends StatefulWidget {
  final List<YT_API> ytResult = [];

  @override
  _ListSongView createState() => _ListSongView();
}

class _ListSongView extends State<ListSongView> {
  @override
  Widget build(BuildContext context) {}
}
