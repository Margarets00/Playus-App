import 'package:flutter/material.dart';
import 'package:playus_app/constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function isClick;
  final int iconCode;
  const Button({
    Key key,
    this.text,
    this.isClick,
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
                  style: TextStyle(fontSize: 53, color: kSecondaryColor),
                ),
                Icon(IconData(iconCode, fontFamily: 'MaterialIcons'),
                    size: 45, color: kSecondaryColor)
              ])),
          Positioned.fill(
              child: Material(
                  color: Colors.transparent, child: InkWell(onTap: isClick))),
        ]));
  }
}
