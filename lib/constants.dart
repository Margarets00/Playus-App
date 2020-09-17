import 'package:flutter/material.dart';

//어플 컬러 파레트
const kPrimaryColor = Color(0xFFa20000);
const kSecondaryColor = Color(0xFFffbe00);
const kTextColor = Color(0xFF000000);

class Background extends StatelessWidget {
  final String where;
  final double height;
  const Background({
    Key key,
    this.where,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment:
            ((where == 'bottom') ? Alignment.bottomRight : Alignment.topRight),
        child: FractionallySizedBox(
          widthFactor: 0.9,
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
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.879),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'PLAYUS',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ))
      ],
    );
  }
}
