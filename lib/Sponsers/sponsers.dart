import 'dart:async';

import 'package:cart_page/Sponsers/glass_box_sessions.dart';
import 'package:cart_page/landing_page/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final List<String> images = [
    'assets/sponsors/fetchAi.png',
    'assets/sponsors/nescafe.jpeg',
    'assets/sponsors/ims.jpeg',
    'assets/sponsors/pizzeria.jpeg',
  ];

  final List<String> sponsorName = [
    "fetch.ai",
    "Nescafe",
    "IMS",
    "1441 - Pizzeria",
  ];
  final List<String> sponsorDesc = [
    'Title Sponsors',
    "Beverage Sponsors",
    "BPlan Sponsors",
    "Food Sponsors",
  ];
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

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
          title: const Text(
            'SPONSORS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'berky',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true, //Title at Centre
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgimg/7.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 32,
                          horizontal: 16,
                        ),
                        child: Glassmorphism(
                          blur: 10,
                          opacity: 0.08,
                          radius: 15,
                          child: FractionallySizedBox(
                            widthFactor:
                                0.9, // Adjust the width factor as needed
                            heightFactor:
                                0.9, // Adjust the height factor as needed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  images[index],
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                Text(
                                  sponsorName[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'berky',
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.005,
                                ),
                                Text(
                                  sponsorDesc[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'berky',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
