import 'package:cart_page/Sponsers/glass_box_sessions.dart';
import 'package:cart_page/landing_page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class PISB extends StatelessWidget {
  const PISB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAll(() => HomePage());
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Color.fromARGB(20, 2, 71, 100),
          title: const Text(
            'PISB',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'berky',
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
              child: SingleChildScrollView(
                // Wrap your content inside SingleChildScrollView
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * 0.08,
                    ),
                    Image.asset(
                      'assets/IEEE_logo.png',
                      width: mediaQuery.size.width * 0.7,
                      height: mediaQuery.size.height * 0.15,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.08,
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
                          padding: const EdgeInsets.all(2),
                          child: const Glassmorphism(
                            blur: 7,
                            opacity: 0.08,
                            radius: 25,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                'PICT IEEE Student Branch (PISB) was established in the year 1988 with an aim of inculcating a sense of technical '
                                'awareness amongst its student members. PISB aims to escalate the knowledge and trends in the diverse fields of '
                                'technologies amongst its members. PISB upholds two majors events every year - Credenz and Credenz Tech Days with the '
                                'first one being conducted in odd semester and the latter one in even semester. PISB is also marked '
                                'by its Women in Engineering (WIE) chapter, an initiative for empowerment of women.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontFamily: 'berky',
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
          ],
        ),
      ),
    );
  }
}
