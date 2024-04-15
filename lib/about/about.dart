import 'package:cart_page/Sponsers/glass_box_sessions.dart';
import 'package:cart_page/landing_page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PISB extends StatelessWidget {
  const PISB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press here
        // For example:
        Get.offAll(() => HomePage());
        return false; // Return true if you want to allow back navigation, false otherwise
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(20, 2, 71, 100),
            title: Text(
              'PISB',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 38.0,
              ),
            ),
            centerTitle: true,
          ),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/bgimg/7.png',
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * 0.04,
                    ),
                    Image.asset(
                      'assets/IEEE_logo.png',
                      width: mediaQuery.size.width * 0.7,
                      height: mediaQuery.size.height * 0.15,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: mediaQuery.size.height * 0.55,
                          width: mediaQuery.size.width * 1,
                          padding: EdgeInsets.all(2),
                          child: Glassmorphism(
                            blur: 7,
                            opacity: 0.08,
                            radius: 25,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: SingleChildScrollView(
                                child: Text(
                                  'PICT IEEE Student Branch (PISB) was established in the year 1988 with an aim of inculcating a sense of technical '
                                  'awareness amongst its student members. PISB aims to escalate the knowledge and trends in the diverse fields of '
                                  'technologies amongst its members. PISB upholds two majors events every year - Credenz and Credenz Tech Days with the '
                                  'first one being conducted in odd semester and the latter one in even semester. PISB is also marked '
                                  'by its Women in Engineering (WIE) chapter, an initiative for empowerment of women.',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
