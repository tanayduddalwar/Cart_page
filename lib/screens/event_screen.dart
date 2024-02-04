import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cart_products.dart';
import '../widgets/event_product.dart';
import '../screens/aboutus.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  void _handleNavigationChange(int index) {

    // Handle navigation change here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events Catalog"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image.jpg"),fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              CatelogProducts(),
              // ElevatedButton(
              //   onPressed: () {
              //     Get.to(AboutUs());
              //   },
              //   child: Text("About Us"),
              // ),
              ElevatedLayerButton(
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
                  "GO TO CART",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                baseDecoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(),
                ),
              ),
            ],
          ),
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
          iconUnselectedForegroundColor: Colors.black,
          iconSelectedForegroundColor: Colors.black,
          barBackgroundColor: Colors.tealAccent,
          
          
        ),
        scaleFactor: 1.0,
        animationFactor: 0.6,
      ),
    );
  }
}
