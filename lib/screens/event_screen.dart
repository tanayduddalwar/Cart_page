import 'package:cart_page/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cart_products.dart';
import '../widgets/event_product.dart';
import '../screens/aboutus.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class EventsScreen extends StatelessWidget {
  // final CartController controller = Get.find();
  EventsScreen({Key? key}) : super(key: key);

  void _handleNavigationChange(int index) {
    // Handle navigation change here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Events Catalog",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CatelogProducts(),
              // Text(), // Assuming this should be CartProducts()
              ElevatedLayerButton(
                onClick: () {
    //                  if (controller.events.isEmpty) {
    //   // Show snackbar if the cart is empty
    //   Get.snackbar(
    //     'Nothing Added To Cart!',
    //     'Ship is not ready to Voyaging!',
    //     snackPosition: SnackPosition.TOP,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //     duration: Duration(seconds: 3),
    //   );
    // } else {
                    Get.to(EventProducts());
                  
                },
                buttonHeight: 60,
                buttonWidth: 270,
                animationDuration: const Duration(milliseconds: 200),
                animationCurve: Curves.bounceInOut,
                topDecoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(),
                ),
                topLayerChild: Text(
                  "SAIL TO CART",
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
