import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cart_page/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cart_page/controllers/cart_controller.dart';
// Import your Event model here

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return DefaultTabController(
      length: 6, // Number of tabs
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
              SizedBox(height: 10,),
              TabBar(
                // Add your tabs here
                tabs: [
                  // Tab(
                  //   icon: Icon(Icons.directions_car),
                  //   text: "car",
                  // ),
                  // Tab(
                  //   icon: Icon(Icons.directions_transit),
                  //   text: "transit",
                  // ),
                  Tab(text: "Tech Events",),
                  Tab(text: "Non Tech Events",),
                  // Tab(icon: Icon(Icons.directions_transit)),
                  // Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.techEvents.length,
                    itemBuilder: (BuildContext context, int index) =>
                        EventProductCard(
                      controller: controller,
                      eventobj: controller.events.keys.toList()[index],
                      index: index,
                    ),
                  ))),
                    
                    // Add your tab views here
                    // Example: EventProductCard(controller: controller, eventobj: eventobj, index: index)
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

class EventProductCard extends StatelessWidget {
  final CartController controller;
  final Event eventobj;
  final int index;

  const EventProductCard({
    Key? key,
    required this.controller,
    required this.eventobj,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cardback.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
        height: 160,
        child: Card(
          elevation: 50,
          color: Colors.white54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(radius: 23, backgroundColor: Colors.black),
              SizedBox(height: 10),
              Text(
                eventobj.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Amount : ${eventobj.price}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Duration: ${eventobj.duration}"),
                    // IconButton(
                    //   onPressed: () async {
                    //     controller.removeProduct(context, eventobj);
                    //   },
                    //   icon: Icon(Icons.remove_circle_outline_rounded),
                    // ),
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