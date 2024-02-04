import 'package:cart_page/screens/aboutus.dart';
import 'package:cart_page/widgets/event_product.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:lottie/lottie.dart';

import '../controllers/cart_controller.dart';
import '../models/event_model.dart';
import '../screens/payment.dart';

class EventProducts extends StatelessWidget {
  final CartController controller = Get.find();

  EventProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/underwaterfish-transformed.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
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
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(MyAppPayment());
                      },
                      child: Text('Go to Payment'),
                    ),
                  ),
                ],
              ),
              CartTotal(),
            ],
          ),
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
      ),
    );
  }

  void _handleNavigationChange(int index) {
    switch (index) {
      case 0:
        Get.to(CatelogProducts());
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
        
        // Navigate to conference screen
        break;
      default:
      // Navigate to default screen, if needed
    }
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 20),
          Text(
            eventobj.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.removeProduct(eventobj);
            },
            icon: Icon(Icons.remove_circle_outline_rounded),
          ),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Obx(() => Text(
                '\Rs.${controller.total}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
