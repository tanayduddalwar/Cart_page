import 'package:flutter/material.dart';

class mygif extends StatelessWidget {
  mygif();

  Widget build(BuildContext con) {
    Size size = MediaQuery.of(con).size;
    return Container(
        child: Column(children: <Widget>[
      SizedBox(
        height: size.height * 0.39,
      ),
      Container(
          //width: size.width * 0.749,
          //height: size.height * 0.2,
          //alignment: Alignment(0.0, 0.0),
          child: CircleAvatar(
        radius: 80,
        child: Image.asset(
          'assets/images/ss.gif',
          /*width: size.width * 0.2,
          height: size.height * 0.01,*/
          fit: BoxFit.cover,
        ),
      )),
    ]));
  }
}
