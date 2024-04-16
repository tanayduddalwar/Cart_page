import 'package:cart_page/developers/interface.dart';
import 'package:cart_page/landing_page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DevelopersPage extends StatefulWidget {
  const DevelopersPage({Key? key}) : super(key: key);

  @override
  State<DevelopersPage> createState() => _HomeState();
}

class _HomeState extends State<DevelopersPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => HomePage(),
            transition: Transition.leftToRight,
            duration: Duration(milliseconds: 500));

        return false; // Allow back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.off(() => HomePage(),
            transition: Transition.leftToRight,
            duration: Duration(milliseconds: 500));
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          title: Text(
            "Developers",
            style: GoogleFonts.montserrat(
              // fontFamily: "berky",
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
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
      ),
    );
  }
}
