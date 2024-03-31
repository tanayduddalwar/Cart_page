import 'package:cart_page/Sponsers/glass_box_sessions.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: SingleChildScrollView(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(20, 2, 71, 100),
          title: const Text(
            'ABOUT US',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'ulove',
              fontSize: 38.0,
            ),
          ),
          centerTitle: true, //Title at Centre
        ),
        extendBodyBehindAppBar:
            true, //the background image gets extended over the AppBar
        body: Builder(
          builder: (context) {
            final mediaQuery = MediaQuery.of(context);
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'images/bgimage.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Image.asset(
                        'images/Credenz.png',
                        height: 240,
                      ),

                      // const Center(
                      //   child: Text(
                      //     "CREDENZ '24 ",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 22.0,
                      //       fontFamily: 'sol_thin',
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      // const Center(
                      //   child: Text(
                      //     "Unveiling Depths",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 10.0,
                      //       fontFamily: 'sol_thin',
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      const Spacer(),
                      // Build Widget Glassmorphism
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            height: mediaQuery.size.height * 0.6,
                            width: mediaQuery.size.width * 1,
                            padding: const EdgeInsets.all(2),
                            child: const Glassmorphism(
                              blur: 7,
                              opacity: 0.08,
                              radius: 25,
                              // decoration: BoxDecoration(
                              //     color: Color.fromARGB(121, 83, 81, 81),
                              //     borderRadius: BorderRadius.circular(25)),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.all(6),
                                child: Text(
                                  'PICT IEEE Student Branch (PISB) was established in the year 1988 with an aim of inculcating a sense of technical ' 
                                  'awareness amongst its student members. PISB aims to escalate the knowledge and trends in the diverse fields of ' 
                                  'technologies amongst its members. PISB upholds two majors events every year - Credenz and Credenz Tech Days with the '
                                  'first one being conducted in odd semester and the latter one in even semester. PISB is also marked '
                                  'by its Women in Engineering (WIE) chapter, an initiative for empowerment of women.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontFamily: 'berkshire',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // ),
    );
  }
}