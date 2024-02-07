import 'package:cart_page/screens/aboutus.dart';
import 'package:cart_page/screens/profile.dart';
import 'package:cart_page/widgets/cart_total.dart';
import 'package:cart_page/widgets/event_product.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:lottie/lottie.dart';

import '../controllers/cart_controller.dart';
import '../models/event_model.dart';
import '../screens/payment.dart';

class EventProducts extends StatelessWidget {
  final CartController controller = Get.find();

  EventProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/underwaterfish-transformed.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(controller.techEvents.length.toString()),
                  Expanded(
                    child: Obx(() => ListView.builder(
                          itemCount: controller.events.length,
                          itemBuilder: (BuildContext context, int index) =>
                              EventProductCard(
                            controller: controller,
                            eventobj: controller.events.keys.toList()[index],
                            index: index,
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedLayerButton(
                          onClick: () {
                            Get.to(EventProducts());
                          },
                          buttonHeight: 60,
                          buttonWidth: 270,
                          animationDuration: const Duration(milliseconds: 200),
                          animationCurve: Curves.ease,
                          topDecoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(),
                          ),
                          topLayerChild: Text(
                            "GO TO PAYMENT",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          baseDecoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CartTotal(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
            icon: Icons.home,
            extras: {"label": "home"},
          ),
          FluidNavBarIcon(
            icon: Icons.bookmark_border,
            extras: {"label": "bookmark"},
          ),
          FluidNavBarIcon(
            icon: Icons.apps,
            extras: {"label": "partner"},
          ),
          FluidNavBarIcon(
            icon: Icons.person_pin,
            extras: {"label": "conference"},
          ),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
          iconBackgroundColor: Colors.tealAccent,
          iconUnselectedForegroundColor: Colors.black,
          iconSelectedForegroundColor: Colors.black,
          barBackgroundColor: Colors.tealAccent,
        ),
        scaleFactor: 1.0,
        animationFactor: 0.6,
      ),
    );
  }

  void _handleNavigationChange(int index) {
    switch (index) {
      case 0:
        // Get.to(CatelogProducts());
        // Navigate to home screen
        break;
      case 1:
        // Navigate to bookmark screen
        break;
      case 2:
        Get.to(AboutUs());
        // Navigate to partner screen
        break;
      case 3:
        Get.to(AdminPage());
        // Navigate to conference screen
        break;
      default:
      // Navigate to default screen, if needed
    }
  }
}

class EventProductCard extends StatelessWidget {
  Future<String> createpayment() async {
    String paymentlink =
        "upi://pay?pa=ameyasurana10@okaxis&pn=tanay&am=10&tn=Credenz%20IEEE&cu=INR";
    return paymentlink;
  }

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
              CircleAvatar(radius: 23, backgroundColor: Colors.black
                  // child: Icon(
                  //   Icons.event, // You can replace this with your own icon or image
                  //   color: Colors.white,
                  //   size: 40,
                  // ),
                  ),
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
                      "Amount :"
                      '${eventobj.price}', // Assuming you want to display the quantity
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () async {
                        controller.removeProduct(context, eventobj);
                      },
                      icon: Icon(Icons.remove_circle_outline_rounded),
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
