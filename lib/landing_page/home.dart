import 'dart:math';

import 'package:cart_page/Buzzer/loginpage.dart';
import 'package:cart_page/Sponsers/sponsers.dart';
import 'package:cart_page/about/about.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/landing_page/nontech.dart';
import 'package:cart_page/landing_page/splash_screen.dart';
import 'package:cart_page/landing_page/tech.dart';
import 'package:cart_page/login/components/login_page.dart';
import 'package:cart_page/login/services/networking.dart';
import 'package:cart_page/ping_page/ping.dart';
import 'package:cart_page/screens/aboutus.dart';
import 'package:cart_page/screens/privacy_content.dart';
import 'package:cart_page/screens/profile.dart';
import 'package:cart_page/widgets/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  double value = 0;
  final CartController cartController = Get.put(CartController());
  bool nav = true;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;
    return value == 0
        ? Scaffold(
            body: PageView(
              controller: pageController,
              children: [
                Stack(
                  children: [
                    SafeArea(child: body()),
                    TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: value),
                        duration: Duration(milliseconds: 275),
                        curve: Curves.easeInOut,
                        builder: (_, double val, __) {
                          return (Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..setEntry(0, 3, 200 * val)
                              ..setEntry(1, 3, 80 * val)
                              ..rotateY((pi / 10) * val)
                              ..scale(1 - val * 0.35),
                            child: Center(
                              child: Stack(
                                children: [
                                  innerbody(),
                                  Positioned(
                                    top: Get.height * 0.055,
                                    left: Get.height * 0.015,
                                    child: Builder(
                                        builder: (BuildContext context) {
                                      return value == 0
                                          ? IconButton(
                                              icon: ImageIcon(
                                                AssetImage(
                                                    'assets/icons/menu.png'),
                                                color: Colors.white,
                                                size: Get.height * 0.0352,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  value == 0
                                                      ? value = 1
                                                      : value = 0;
                                                });
                                              },
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  value == 1
                                                      ? value = 0
                                                      : value = 1;
                                                });
                                              },
                                              icon: Icon(Icons.close));
                                    }),
                                  )
                                ],
                              ),
                            ),
                          ));
                        }),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: WaterDropNavBar(
                  backgroundColor: Color.fromRGBO(0, 7, 29, 1.0),
                  waterDropColor: Color(0xFF024083),
                  bottomPadding: 12.0,
                  iconSize: 30,
                  onItemSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    pageController.animateToPage(selectedIndex,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOutQuad);
                    switch (index) {
                      case 0:
                        // Handle the first item
                        break;
                      case 1:
                        // Handle the second item
                        break;
                      case 2:
                        break;
                      case 3:
                        Get.to(EventProducts());
                        break;

                      case 4:
                        Get.to(AdminPage());
                        break;
                      // Add cases for other items as needed
                    }
                  },
                  selectedIndex: selectedIndex,
                  barItems: [
                    BarItem(
                      filledIcon: Icons.calendar_today,
                      outlinedIcon: Icons.calendar_today_outlined,
                    ),
                    BarItem(
                        filledIcon: Icons.account_box,
                        outlinedIcon: Icons.account_box_outlined),
                    BarItem(
                        filledIcon: Icons.home_rounded,
                        outlinedIcon: Icons.home_outlined),
                    BarItem(
                        filledIcon: Icons.info,
                        outlinedIcon: Icons.info_outline_rounded),
                    BarItem(
                        filledIcon: Icons.account_box,
                        outlinedIcon: Icons.account_box_outlined),
                  ],
                ),
              ),
            ))
        : Scaffold(
            body: PageView(
              controller: pageController,
              children: [
                Stack(
                  children: [
                    SafeArea(child: body()),
                    TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: value),
                        duration: Duration(milliseconds: 275),
                        curve: Curves.easeInOut,
                        builder: (_, double val, __) {
                          return (Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..setEntry(0, 3, 150 * val)
                              ..setEntry(1, 3, 20 * val)
                              ..rotateY((pi / 9) * val)
                              ..scale(1 - val * 0.35),
                            child: Center(
                              child: Stack(
                                children: [
                                  innerbody(),
                                  Positioned(
                                    top: Get.height * 0.055,
                                    left: Get.height * 0.015,
                                    child: Builder(
                                        builder: (BuildContext context) {
                                      return value == 0
                                          ? IconButton(
                                              icon: ImageIcon(
                                                AssetImage(
                                                    'assets/icons/menu.png'),
                                                color: Colors.white,
                                                size: Get.height * 0.0352,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  value == 0
                                                      ? value = 1
                                                      : value = 0;
                                                });
                                              },
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  value == 1
                                                      ? value = 0
                                                      : value = 1;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 35,
                                              ));
                                    }),
                                  )
                                ],
                              ),
                            ),
                          ));
                        }),
                  ],
                ),
              ],
            ),
          );
  }
}

Widget body() {
  final screenHeight = Get.height;
  final screenWidth = Get.width;
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF045AAB), Color(0xFF131321)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.07),
              Text(
                'Credenz',
                style: GoogleFonts.berkshireSwash(
                  color: Colors.white,
                  fontSize: Get.width * 0.09,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: screenHeight * 0.175,
        child: Container(
          height: screenHeight * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: screenWidth * 0.8,
                  child: Divider(
                    thickness: screenWidth * 0.002,
                    color: Colors.white60,
                  )),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => PISB()),
                    child: Text("PISB",
                        style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.white,
                            fontFamily: "berky")),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.050,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  Icon(
                    Icons.inbox_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  InkWell(
                    onTap: () => Get.to(PingPage()),
                    child: Text("PING",
                        style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.white,
                            fontFamily: "berky")),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Container(
                  width: screenWidth * 0.8,
                  child: Divider(
                    thickness: screenWidth * 0.01,
                    color: Colors.white60,
                  )),
              SizedBox(height: screenHeight * 0.035),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  InkWell(
                    onTap: () => Get.to(VideosScreen()),
                    child: Text("Sponsors",
                        style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.white,
                            fontFamily: "berky")),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  InkWell(
                    onTap: () => Get.offAll(Login()),
                    child: Text("Quiz",
                        style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.white,
                            fontFamily: "berky")),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  Icon(
                    Icons.developer_mode,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  InkWell(
                    onTap: () => Get.to(AboutUs()),
                    child: Text("Developers",
                        style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.white,
                            fontFamily: "berky")),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              Container(
                  width: screenWidth * 0.8,
                  child: Divider(
                    thickness: screenWidth * 0.01,
                    color: Colors.white60,
                  )),
              SizedBox(height: screenHeight * 0.035),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  Icon(
                    Icons.privacy_tip,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  InkWell(
                    onTap: () => Get.to(PrivacyPolicy()),
                    child: Text("Privacy Policy",
                        style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.white,
                            fontFamily: "berky")),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: screenWidth * 0.07,
                  ),
                  FutureBuilder<bool>(
                    future: database().checkLoggedIn(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData && snapshot.data == true) {
                          return InkWell(
                            onTap: () async {
                              database db = database();
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.clear();
                              db.logout();
                              Get.snackbar(
                                  'Logged Out Successfully', 'Success');
                              Get.offAll(() => SplashScreen());
                            },
                            child: Text("Logout",
                                style: TextStyle(
                                    fontSize: screenHeight * 0.02,
                                    color: Colors.white,
                                    fontFamily: "berky")),
                          );
                        } else {
                          return InkWell(
                            onTap: () => Get.to(() => LoginPage()),
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: screenHeight * 0.02,
                                    color: Colors.white,
                                    fontFamily: "berky")),
                          );
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Container(
                width: screenWidth * 0.6,
                child: Divider(
                  thickness: screenWidth * 0.002,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget innerbody() {
  final screenHeight = Get.height;
  final screenWidth = Get.width;
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.jpeg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.1),
          Hero(
            tag: 'event-name',
            child: Text(
              'Credenz 24',
              style: GoogleFonts.berkshireSwash(
                color: Colors.white,
                fontSize: screenWidth * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.06,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.3,
                width: screenWidth * 0.47,
                child: CardWidget(
                  logo: AssetImage('assets/images/monitor.png'),
                  eventName: 'Tech\nEvents',
                  color1: Color.fromRGBO(1, 93, 180, 0.5),
                  color2: Color.fromRGBO(1, 37, 84, 1),
                  onTap: () {
                    Get.to(TechEventsPage());
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenHeight * 0.3,
                width: screenWidth * 0.47,
                child: CardWidget(
                  logo: AssetImage('assets/images/web.png'),
                  eventName: 'Non Tech\nEvents',
                  color1: Color.fromRGBO(1, 93, 180, 0.2),
                  color2: Color.fromRGBO(1, 10, 23, 1),
                  onTap: () {
                    Get.to(NonTechEventsPage());
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

class CardWidget extends StatelessWidget {
  final AssetImage logo;
  final String eventName;
  final VoidCallback onTap;
  final Color color1;
  final Color color2;

  const CardWidget({
    required this.logo,
    required this.eventName,
    required this.onTap,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16), // Adjust the radius as needed
        ),
        elevation: 0, // Remove card elevation
        child: Container(
          padding: EdgeInsets.all(5),
          height: Get.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(16), // Match the card's border radius
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: logo, height: 90, width: 100),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Hero(
                  tag: eventName, // Adding hero tag to text
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      eventName,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "berky",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}