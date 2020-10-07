import 'package:flutter/material.dart';

//어플 컬러 파레트
const kPrimaryColor = Color(0xFFa20000);
const kSecondaryColor = Color(0xFFffbe00);
const kTextColor = Color(0xFF000000);

class Background extends StatelessWidget {
  final String where;
  final double height;
  final double width;
  const Background({
    Key key,
    this.where,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment:
            ((where == 'bottom') ? Alignment.bottomRight : Alignment.topRight),
        child: FractionallySizedBox(
          widthFactor: ((width == null) ? 0.9 : width),
          heightFactor: height,
          alignment: FractionalOffset.center,
          child: Container(
            color: Color(0xFFffbe00),
          ),
        ));
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [*/
        Container(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
                alignment: FractionalOffset.bottomRight,
                heightFactor: 0.17,
                widthFactor: 0.9,
                //child: Padding(
                //padding: EdgeInsets.only(
                //  top: MediaQuery.of(context).size.height * 0.05, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'PREV',
                          style: TextStyle(fontSize: 30, height: 1),
                        )
                      ],
                    ),
                    Text(
                      'PLAYUS',
                      style: TextStyle(fontSize: 50, height: 1),
                    ),
                  ],
                  //)
                )));
    //],
    //);
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function isClick;
  final int iconCode;
  final dynamic wordspace;
  const Button({
    Key key,
    this.text,
    this.isClick,
    this.wordspace,
    this.iconCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.height * 0.25,
        height: MediaQuery.of(context).size.width * 0.15,
        child: Stack(children: [
          Container(
              padding: EdgeInsets.only(left: 7, top: 5),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xFFa20000),
              ),
              child: Row(children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 53,
                      color: kSecondaryColor,
                      wordSpacing: wordspace),
                ),
                if (iconCode != null) ...[
                  (Icon(IconData(iconCode, fontFamily: 'MaterialIcons'),
                      size: 45, color: kSecondaryColor)),
                ]
              ])),
          Positioned.fill(
              child: Material(
                  color: Colors.transparent, child: InkWell(onTap: isClick))),
        ]));
  }
}
