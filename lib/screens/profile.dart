import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/screens/tech_events.dart'; // Import your TechEventsPage here
import 'package:cart_page/screens/nontech_events.dart'; // Import your NonTechEventsPage here

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/water.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                " PROFILE ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 20),
                  CircularProfileAvatar(
                    '',
                    radius: 50,
                    backgroundColor: Colors.tealAccent,
                    borderWidth: 6,
                    initialsText: Text("Tanay"),
                    borderColor: Colors.yellowAccent,
                    elevation: 30.0,
                    foregroundColor: Colors.brown.withOpacity(0.5),
                    cacheImage: true,
                    imageFit: BoxFit.cover,
                    onTap: () {
                      print(controller.techEvents);
                    },
                    showInitialTextAbovePicture: false,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Icon(Icons.person_pin_circle_sharp, size: 50),
                  Text(
                    "Tanay Duddalwar",
                    style: TextStyle(fontSize: 20),
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
                  Text(
                    "tanay2duddalwar@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                  Text(
                    "9309558432",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
   // color: Colors.pink.withOpacity(0.5), // Adjust opacity as needed
  ),
  tabs: [
    Tab(

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber.withOpacity(0.1), // Adjust opacity as needed
        ),
        child: Text(
          "Tech Events",
          style: TextStyle(fontSize: 19,),

        ),
      ),
    ),
    
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber.withOpacity(0.3), // Adjust opacity as needed
        ),
        child: Text(
          "Non Tech Events",
          style: TextStyle(fontSize: 19,),
        ),
      ),
    ),
  ],
),

              Expanded(
                child: TabBarView(

                  children: [
                    controller.techEvents.isEmpty
                        ? Center(child: Text("No Tech Events",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),))
                        : TechEventsPage(),
                    controller.nonTechEvents.isEmpty
                        ? Center(child: Text("No Non Tech Events",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),))
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
