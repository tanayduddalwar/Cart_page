import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cart_page/screens/nth.dart';
import 'package:cart_page/screens/privacy_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/screens/tech_events.dart'; 
import 'package:cart_page/screens/nontech_events.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
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
                 title:TextLiquidFill(
    text: 'PROFILE',
    waveColor: Colors.blueAccent,
    boxBackgroundColor:const Color.fromARGB(255, 48, 197, 230),
    textStyle: TextStyle(
      fontFamily: "Ulove",
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
    boxHeight: 300.0,
  ),
  
                //   " PROFILE ",
                //   style: TextStyle(
                //     fontSize: 25,
                //     fontWeight: FontWeight.bold,
                //     fontFamily: "Ulove",
                //   ),
                // ),
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
                         PopupMenuItem(
                          child: Text("NTH"),
                          value: "NTH",
                        ),
                      ],
                      onSelected: (value) {
    if (value == "IEEE") {
      Get.to(Nth());
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
                    child: CircularProfileAvatar(
                      '',
                      radius: 50,
                      backgroundColor: Colors.tealAccent,
                      borderWidth: 6,
                      initialsText: Text(
                        "Tanay",
                        style: TextStyle(fontFamily: "Bunaken", fontSize: 25),
                      ),
                      borderColor: Colors.yellowAccent,
                      elevation: 30.0,
                      foregroundColor: Colors.brown.withOpacity(0.5),
                      cacheImage: true,
                      imageFit: BoxFit.cover,
                      showInitialTextAbovePicture: false,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Icon(Icons.person_pin_circle_sharp, size: 50),
                  Text(
                    "Tanay Duddalwar",
                    style: TextStyle(fontSize: 25, fontFamily: "Bunaken"),
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
                      "tanay2duddalwar@gmail.com",
                      style: TextStyle(
                          color: Colors.white, fontSize: 25, fontFamily: "Bunaken"),
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
                        "9309558432",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "Bunaken",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //MyHomePage(title: "Hi");
                        },
                        child: Text("Ticket"),
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
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber.withOpacity(0.1),
                      ),
                      child: Text(
                        "Tech Events",
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: "Bunaken"
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber.withOpacity(0.3),
                      ),
                      child: Text(
                        "Non Tech Events",
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: "Bunaken"
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    controller.techEvents.isEmpty
                        ? Center(
                            child: Text(
                            "No Tech Events",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Bunaken"),
                          ))
                        : TechEventsPage(),
                    controller.nonTechEvents.isEmpty
                        ? Center(
                            child: Text(
                            "No Non Tech Events",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "Bunaken"),
                          ))
                        : NonTechEventsPage(),
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
