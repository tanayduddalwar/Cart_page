import 'package:cart_page/landing_page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PingPage extends StatefulWidget {
  PingPage({Key? key}) : super(key: key);

  @override
  State<PingPage> createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final websiteUri = Uri.parse('https://www.pictieee.in/ping181');

    return WillPopScope(
      onWillPop: () async {
        Get.off(() => HomePage(),transition: Transition.leftToRight,
            duration: Duration(milliseconds: 500));
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       Get.off(HomePage());
            //     },
            //     icon: Icon(Icons.arrow_back),
            //   ),
            // ],
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.14, top: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  "P.I.N.G",
                style: GoogleFonts.montserrat(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgimg/5.png'),
                opacity: 1,
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.232),
                    height: screenWidth * 0.66,
                    child: GestureDetector(
                      onTap: () async {
                        if (await canLaunch(websiteUri.toString())) {
                          await launch(websiteUri.toString());
                        } else {
                          throw 'Could not launch url';
                        }
                      },
                      child: Container(
                        color: const Color(0xFFE9E9E9),
                        child: Center(
                          child: Image.asset(
                            'assets/img.jpg',
                            height: screenHeight * 0.66,
                            width: screenWidth * 1,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.center,
                          colors: [Colors.white30, Colors.white30],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Center(
                            child: Text(
                              'P.I.N.G (PICT IEEE Newsletter Group is the official technical magazine of PICT published'
                              'twice a year .PING server as a platform for individuals to portray their technical ingenuity.It highlight '
                              'article outcutting edge technologies form technocrats all around the global including student industrialists'
                              'and faculty members .It also features interviews of distinguished personalities in various technical domain.'
                              'P.I.N.G aims at keeping its readers up to data on recent developments in technology and help them extrapolate'
                              'their perception to contemporary ideas of modernisation. ',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
