import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:playus_app/constants.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:html_unescape/html_unescape.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class PartyRequest {
  //값을 받아올때 사용하는 개체
  final String id;
  final String title;
  PartyRequest({this.id, this.title});
  factory PartyRequest.fromJson(Map<String, String> json) {
    return PartyRequest(
      id: json['id'],
      title: json['title'],
    );
  }
}

//방 입장하는 리퀘스트
Future<void> roomPass(String code) async {
  print(code);
  final http.Response response =
      await http.get('https://playus.herokuapp.com/' + code);
  if (response.statusCode == 200) {
    print('accepted!');
    //} else if (response.statusCode == 202) {
    //응답을 받았을 경우
    //print('completed!');
    //print(inspect(PartyRequest.fromJson(json.decode(response.body))));
    //return PartyRequest.fromJson(json.decode(response.body)); //데이터 받아오기
  } else {
    //print('실패');
    //return Future<bool>.value(false);
    throw Exception('Failed to enter the room');
  }
}

Future<List> searchAPI(String keywords) async {
  final String YOUTUBE_API = 'AIzaSyDP5khM0bM6hxMmn1nkIO6d4I1bnHy6kdw';
  YoutubeAPI ytApi = new YoutubeAPI(YOUTUBE_API, maxResults: 12, type: "video");
  try {
    List<YT_API> ytResult = await ytApi.search(keywords);
    return ytResult;
  } catch (e) {
    return e;
  }
}
