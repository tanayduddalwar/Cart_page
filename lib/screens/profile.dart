import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cart_page/about/about.dart';
import 'package:cart_page/login/services/networking.dart';
import 'package:cart_page/models/user_model.dart';
import 'package:cart_page/ping_page/ping.dart';
import 'package:cart_page/screens/privacy_content.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/screens/tech_events.dart';
import 'package:cart_page/screens/nontech_events.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final CartController controller = Get.find();
  Map<dynamic, dynamic> profiledata = {};
  List<String> technicalEventNames = [
    "Clash",
    "REVERSE CODING",
    "Cretonix",
    "Datawiz",
    "Webweaver",
    "Roboliga"
  ];
  List<dynamic> isTechnical = [];
  List<dynamic> isNonTechnical = [];
  Future<void> loaddata() async {
    database db = database();
    profiledata = await db.profile();

    List<dynamic> orders = profiledata['orders'];

    // Iterate through orders
    orders.forEach((order) {
      // Access event name
      String eventName = order['event']['event_name'];

      // Check if the event name is in the technical event names list
      if (technicalEventNames.contains(eventName)) {
        isTechnical.add(order['event']);
      } else {
        isNonTechnical.add(order['event']);
      }
      print(isTechnical);
      print(isNonTechnical);
    });
  }

  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: FutureBuilder(
          future: loaddata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return Container(
                height: MediaQuery.of(context).size.height *
                    0.9, // Adjust the height as needed
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/common.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    //SizedBox(height: 40),
                    AppBar(
                      centerTitle: true,
                      title: Text(
                        'PROFILE',
                        style: TextStyle(
                          fontFamily: "berky",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: PopupMenuButton(
                            color: Colors.white70,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("PING"),
                                value: "PING",
                              ),
                              PopupMenuItem(
                                child: Text("IEEE"),
                                value: "IEEE",
                              ),
                              PopupMenuItem(
                                child: Text("PRIVACY POLICY"),
                                value: "PRIVACY POLICY",
                              ),
                            ],
                            onSelected: (value) {
                              if (value == "PING") {
                                Get.to(() => PingPage());
                              }
                              if (value == "IEEE") {
                                Get.to(() => PISB());
                              }
                              if (value == "PRIVACY POLICY") {
                                Get.to(PrivacyPolicy());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        InkWell(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.tealAccent,
                              border:
                                  Border.all(color: Colors.yellowAccent, width: 6),
                            ),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage("assets/coder.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Icon(Icons.person_pin_circle_sharp, size: 50),
                        Column(
                          children: [
                            Text(
                              "${profiledata['full_name']}",
                              style: TextStyle(fontSize: 18, fontFamily: "berky",color: Colors.white),
                            ),
                            Text(
                              "${profiledata['username']}",
                              style: TextStyle(fontSize: 18, fontFamily: "berky",color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 55),
                        Icon(
                          Icons.email_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          child: Text(
                            "${profiledata['email']}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "berky"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 55),
                        Icon(
                          Icons.phone_in_talk_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Text(
                              "${profiledata['phone']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: "berky",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    TabBar(
                      isScrollable: true,
                      dividerColor: Colors.amber,
                      automaticIndicatorColorAdjustment: true,
                      dividerHeight: 5,
                      enableFeedback: true,
                      labelColor: Colors.amber,
                      labelPadding: EdgeInsets.all(10),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.pink.withOpacity(0.5),
                      ),
                      tabs: [
                        Tab(
                          iconMargin: EdgeInsets.all(50),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.withOpacity(0.3),
                            ),
                            child: Text(
                              "Tech",
                              style: TextStyle(
                                  fontSize: 19, fontFamily: "berky"),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.withOpacity(0.3),
                            ),
                            child: Text(
                              "Non Tech",
                              style: TextStyle(
                                  fontSize: 19, fontFamily: "berky"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5), // Add some space between tabs and content
                    Expanded(
                      child: TabBarView(
                        children: [
                          isTechnical.isEmpty
                              ? Center(
                                  child: Text(
                                  "No Tech",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "berky"),
                                ))
                              : TechEventsPage(
                                  isTechnical: isTechnical,
                                ),
                          isNonTechnical.isEmpty
                              ? Center(
                                  child: Text(
                                  "No Non Tech Events",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: "berky"),
                                ))
                              : NonTechEventsPage(
                                  isNonTechnical: isNonTechnical),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
