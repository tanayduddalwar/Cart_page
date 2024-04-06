import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cart_page/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:badges/badges.dart' as badges;
import '../controllers/cart_controller.dart';
import '../widgets/cart_products.dart';
import '../widgets/event_product.dart';
import '../screens/aboutus.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class EventsScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  final player = AudioPlayer();

  EventsScreen({Key? key}) : super(key: key);

  void _handleNavigationChange(int index) {
    // Handle navigation change here
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/credenz24.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title:
                    TextLiquidFill(
    text: 'CATELOG',
    waveColor: Colors.blueAccent,
    boxBackgroundColor: Colors.redAccent,
    textStyle: TextStyle(
      fontFamily: "Ulove",
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
    boxHeight: 300.0,
  ),
                    // "Events Catalog",
                    // style: TextStyle(
                    //   fontSize: screenWidth * 0.06,
                    //   fontWeight: FontWeight.bold,
                    //   fontFamily: "Ulove",
                    // ),
                  
                  actions: [
                    Obx(
                      () => Row(
                        children: [
                          badges.Badge(
                            onTap: () => EventProducts(),
                            badgeContent: Text(
                              "${controller.events.length}",
                              style: TextStyle(fontFamily: "Bunaken"),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () => EventProducts(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CatelogProducts(), // Corrected to CartProducts()
              ElevatedLayerButton(
                onClick: () {
                  player.play(AssetSource("assets/water-drop-85731.mp3"));
                  Get.to(EventProducts());
                },
                buttonHeight: screenWidth * 0.15,
                buttonWidth: screenWidth * 0.7,
                animationDuration: const Duration(milliseconds: 200),
                animationCurve: Curves.bounceInOut,
                topDecoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(),
                ),
                topLayerChild: Hero(
                  tag: "home",
                  child: Text(
                    "SAIL TO CART",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
         onChange: _handleNavigationChange1,

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

  void _handleNavigationChange1(int index) {
    switch (index) {
      case 2:
        Get.to(AdminPage());
        // Navigate to home screen
        break;
    }
  }
}
