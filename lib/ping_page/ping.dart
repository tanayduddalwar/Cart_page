
import 'package:cart_page/landing_page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PingPage extends StatefulWidget {
  bool pressed = false;

  PingPage({super.key});
  @override
  State<PingPage> createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final websteUri = Uri.parse('https://www.google.com/');

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offAll(() => HomePage());
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.14,top: 20),
            child: SizedBox(
              width: 200,
               child: Text(
                 "P.I.N.G",
                 style: TextStyle(
                   fontFamily: "berky",
                   fontSize: 30,
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                 ),
               ),
              // TextLiquidFill(
              //   text: 'P.I.N.G',
              //   waveColor: Colors.blueAccent,
              //   boxBackgroundColor: const Color.fromARGB(255, 48, 197, 230),
              //   textStyle: const TextStyle(
              //     fontSize: 35.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   boxHeight: 100.0,
              // ),
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
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 20),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.232),
                    height: screenWidth * 0.66,
                    child: Container(
                      color: const Color(0xFFE9E9E9),
                      child: Center(
                        child: Image.asset(
                          'assets/images/img.jpg',
                          height: screenHeight * 0.66,
                          width: screenWidth * 1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                const SizedBox(height: 25.0),
                Container(
                  height: screenHeight * 0.56,
                  width: screenWidth * 0.7,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                        colors: [Colors.white30, Colors.white30]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: const Center(
                          child: Text(
                            'P.I.N.G (PICT IEEE Newsletter Group is the official technical magazine of PICT published'
                            'twise a year .PING server as a platform for individuals to portray their technical ingenuity.It highlight '
                            'article outcutting edge technologies form technocrats all around the global including student industrialists'
                            'and faculty members .It also features interviews of distinguished personalities in various technical domain.'
                            'P.I.N.G aims at keeping its readers up to data on recent developments in technology and help them extrapolate'
                            'their perception to contemporary ideas of modernisation. ',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                                fontFamily: 'berky'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AnimatedButton(
                        onPress: () {
                          launchUrl(websteUri, mode: LaunchMode.inAppWebView);
                        },
                        height: 70,
                        width: 200,
                        text: 'Website',
                        gradient:
                            LinearGradient(colors: [Colors.red, Colors.orange]),
                        selectedGradientColor: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.purpleAccent]),
                        isReverse: true,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
                        textStyle: const TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                        borderColor: Colors.white,
                        borderWidth: 1,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
