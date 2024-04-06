
import 'package:cart_page/developers/interface.dart';
import 'package:flutter/material.dart';

import 'package:random_text_reveal/random_text_reveal.dart';

class DevelopersPage extends StatefulWidget {
  const DevelopersPage({Key? key}) : super(key: key);

  @override
  State<DevelopersPage> createState() => _HomeState();
}

class _HomeState extends State<DevelopersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Developers" ,style: TextStyle(
          fontFamily: "berky",
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
        ),),
        // const RandomTextReveal(
        //   text: "DEVELOPERS",
        //   duration: Duration(seconds: 2),
        //   style: TextStyle(
        //     fontFamily: 'Mars',
        //     fontSize: 25,
        //     letterSpacing: 2,
        //   ),
        // ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bgimg/4.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
         ui()
        ],
      ),
    );
  }
}
