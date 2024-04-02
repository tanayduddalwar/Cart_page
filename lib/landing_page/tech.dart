import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechEventsPage extends StatefulWidget {
  @override
  _TechEventsPageState createState() => _TechEventsPageState();
}

class _TechEventsPageState extends State<TechEventsPage> {
  PageController _pageController = PageController();
  Color _containerColor = Color.fromRGBO(7, 14, 71, 1);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      int currentPage = _pageController.page?.round() ?? 0;
      // Adjust color based on current page or any other logic
      _containerColor = currentPage % 2 == 0
          ? Color.fromRGBO(7, 14, 71, 1)
          : Color.fromRGBO(5, 10, 52, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/background.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.height * 1,
                  color: _containerColor,
                  child: Center(
                    child: Text(
                      'Credenz',
                      style: GoogleFonts.berkshireSwash(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: _containerColor,
                  width: MediaQuery.of(context).size.height * 1,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.059,
                  ),
                  child: Center(
                    child: Text(
                      "Tech Events",
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return revCombinedEventCard();
                      } else {
                        return CombinedEventCard();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CombinedEventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/page2.gif"),
        fit: BoxFit.cover,
      )),
      // color: Colors.black,
      height: 800,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.2,
        left: MediaQuery.of(context).size.width * 0.01,
        right: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                // color: Colors.black,
                height: 120,
                width: 120,
                child: Center(
                  child: Text(
                    "DATAWIZ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  // right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: EventCard(
                  color1: Color.fromRGBO(4, 90, 171, 0.7),
                  color2: Color.fromRGBO(1, 37, 84, 0.7),
                  width: MediaQuery.of(context).size.width * 0.4,
                  eventimgsrc: "assets/datawiz.png",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: EventCard(
                  color1: Color.fromRGBO(1, 93, 180, 0.7),
                  color2: Color.fromRGBO(1, 37, 84, 0.7),
                  width: MediaQuery.of(context).size.width * 0.4,
                  eventimgsrc: "assets/webweaver.png",
                ),
              ),
              Container(
                // color: Colors.black,
                height: 120,
                width: 120,
                child: Center(
                  child: Text(
                    "WEB WEAVER",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                // color: Colors.black,
                height: 120,
                width: 120,
                child: Center(
                  child: Text(
                    "ROBO LIGA",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  // right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: EventCard(
                  color1: Color.fromRGBO(4, 90, 171, 0.7),
                  color2: Color.fromRGBO(1, 37, 84, 0.7),
                  width: MediaQuery.of(context).size.width * 0.4,
                  eventimgsrc: "assets/roboliga.png",
                ),
              ),
            ],
          ),
        ],
      ),
      // child: Column(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(
      //         left: MediaQuery.of(context).size.width * 0.4,
      //         right: MediaQuery.of(context).size.width * 0.1,
      //       ),
      //       child: EventCard(
      //         color1: Color.fromRGBO(1, 93, 180, 0.7),
      //         color2: Color.fromRGBO(1, 37, 84, 0.7),
      //         width: MediaQuery.of(context).size.width * 0.4,
      //         eventimgsrc: "assets/images/events/datawiz.png",
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(
      //         left: MediaQuery.of(context).size.width * 0.1,
      //         right: MediaQuery.of(context).size.width * 0.45,
      //       ),
      //       child: EventCard(
      //         color1: Color.fromRGBO(4, 90, 171, 0.7),
      //         color2: Color.fromRGBO(1, 37, 84, 0.7),
      //         width: MediaQuery.of(context).size.width * 0.4,
      //         eventimgsrc: "assets/images/events/enigma.png",
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(
      //         left: MediaQuery.of(context).size.width * 0.4,
      //         right: MediaQuery.of(context).size.width * 0.1,
      //       ),
      //       child: EventCard(
      //         color1: Color.fromRGBO(2, 65, 125, 0.7),
      //         color2: Color.fromRGBO(2, 28, 61, 0.7),
      //         width: MediaQuery.of(context).size.width * 0.4,
      //         eventimgsrc: "assets/images/events/web-weaver.png",
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class EventCard extends StatelessWidget {
  final double width;
  final Color color1;
  final Color color2;
  final String eventimgsrc;

  const EventCard({
    required this.width,
    required this.color1,
    required this.color2,
    required this.eventimgsrc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
              eventimgsrc,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class revCombinedEventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/page3.gif"),
        fit: BoxFit.cover,
      )),
      // color: Colors.black,
      height: 800,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.2,
        left: MediaQuery.of(context).size.width * 0.01,
        right: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: EventCard(
                  color1: Color.fromRGBO(1, 93, 180, 0.7),
                  color2: Color.fromRGBO(1, 37, 84, 0.7),
                  width: MediaQuery.of(context).size.width * 0.4,
                  eventimgsrc: "assets/Clash.png",
                ),
              ),
              Container(
                // color: Colors.black,
                height: 120,
                width: 120,
                child: Center(
                  child: Text(
                    "CLASH",
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                // color: Colors.black,
                height: 120,
                width: 120,
                child: Center(
                  child: Text(
                    "RC",
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  // right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: EventCard(
                  color1: Color.fromRGBO(4, 90, 171, 0.7),
                  color2: Color.fromRGBO(1, 37, 84, 0.7),
                  width: MediaQuery.of(context).size.width * 0.4,
                  eventimgsrc: "assets/RC.png",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  // right: MediaQuery.of(context).size.width * 0.45,
                ),
                child: EventCard(
                  color1: Color.fromRGBO(2, 65, 125, 0.7),
                  color2: Color.fromRGBO(2, 28, 61, 0.7),
                  width: MediaQuery.of(context).size.width * 0.4,
                  eventimgsrc: "assets/cretronix.png",
                ),
              ),
              Container(
                // color: Colors.black,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                height: 120,
                width: 120,
                child: Center(
                  child: Text(
                    "CRETONIX",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}