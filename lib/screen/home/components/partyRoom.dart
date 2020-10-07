import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:playus_app/constants.dart';
import 'package:marquee/marquee.dart';
import 'package:playus_app/screen/home/components/partySearch.dart';

@immutable
class PartyRoom extends StatefulWidget {
  final String code;
  PartyRoom({
    Key key,
    this.code,
  }) : super(key: key);
  @override
  _PartyRoom createState() => _PartyRoom(code);
}

class _PartyRoom extends State<PartyRoom> {
  final String code;
  _PartyRoom(this.code);
  bool isLoading;
  ViewportOffset temp;
  @override
  void initState() {
    //딱 한번 호출 되는거. 이걸로 요청하면됨
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Background(
          where: 'bottom',
          height: 0.89,
        ),
        Navigation(),
        Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.13),
            //padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.11),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Hi! Buddy!',
                              style: Theme.of(context).textTheme.headline2,
                            )),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Button(
                              text: 'ADD SONG',
                              wordspace: -10.0,
                              isClick: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          PartySearch(),
                                    ));
                              },
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Button(text: 'PLAYLIST', wordspace: -10.0))
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'PLAYING NOW',
                            style: Theme.of(context).textTheme.headline2,
                          )),
                      Row(
                        children: [
                          Icon(Icons.album, size: 45, color: kTextColor),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 30),
                              child: SizedBox(
                                height: 50,
                                child: Marquee(
                                  text: '바다가 부르는 소리',
                                  style: Theme.of(context).textTheme.headline2,
                                  velocity: 50,
                                  blankSpace: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          (Icon(Icons.skip_previous,
                              size: 45, color: kTextColor)),
                          (Icon(Icons.play_arrow, size: 45, color: kTextColor)),
                          (Icon(Icons.skip_next, size: 45, color: kTextColor))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}
