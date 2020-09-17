import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String where;
  const Background({
    Key key,
    this.where,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment:
            ((where == 'bottom') ? Alignment.bottomRight : Alignment.topRight),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.95,
          alignment: FractionalOffset.center,
          child: Container(
            color: Color(0xFFffbe00),
          ),
        ));
  }
}
