import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cart_page/screens/about.dart';
import 'package:cart_page/screens/aboutus.dart';
import 'package:cart_page/screens/payment.dart';
import 'package:cart_page/screens/profile.dart';
import 'package:cart_page/widgets/cart_total.dart';
import 'package:cart_page/widgets/event_product.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';
import 'package:super_banners/super_banners.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sliding_widget/sliding_widget.dart';
import 'package:badges/badges.dart' as badges;

import '../controllers/cart_controller.dart';
import '../models/event_model.dart';

class EventProducts extends StatelessWidget {
  final player = AudioPlayer();
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
                  image: AssetImage("assets/common.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: AppBar(
                          centerTitle: true,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title:Container(
                            width: 270,
                            child: TextLiquidFill(
                              boxWidth: 220,
                                text: 'CART PAGE',
                                waveColor: Colors.blue,
                               boxBackgroundColor: const Color.fromARGB(255, 48, 197, 230),
                                textStyle: TextStyle(
                                  fontFamily: "Ulove",
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                boxHeight: 300.0,
                              ),
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:8.0),
                              child: Obx(
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
                                        onPressed: () => {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (controller.events.length == 0)
                    Text("No item added to cart")
                  else
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Obx(
                          () => ListView.builder(
                            itemCount: controller.events.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 3.0),
                                  padding: const EdgeInsets.all(8.0),
                                  child: EventProductCard(
                                                                controller: controller,
                                                                eventobj: controller.events.keys.toList()[index],
                                                                index: index,
                                                              ),
                                ),
                            
                          ),
                          
                        ),
                      
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlidingWidget(
                            width: 260,
                            height: 58,
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            iconColor: Colors.red,

                            /// Text to be displayed inside the button.
                            label: 'Go To Payment',
                            
                            

                            shadow: const BoxShadow(color: Colors.red),

                            /// Accepts function, default is null, this property is required.
                            action: () {
                              Get.to(Payment());
                            },

                            child: const Icon(Icons.arrow_forward_ios),

                            /// Whether the icon to be fixed at the end.
                            stickToEnd: false,
                          )
                          // child: ElevatedLayerButton(
                          //   onClick: () {
                          //     Get.to(Payment());
                          //   },
                          //   buttonHeight: 60,
                          //   buttonWidth: 270,
                          //   animationDuration: const Duration(milliseconds: 200),
                          //   animationCurve: Curves.ease,
                          //   topDecoration: BoxDecoration(
                          //     color: Colors.amber,
                          //     border: Border.all(),
                          //   ),
                          //   topLayerChild: Text(
                          //     "GO TO PAYMENT",
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          //   baseDecoration: BoxDecoration(
                          //     color: Colors.green,
                          //     border: Border.all(),
                          //   ),
                          // ),
                          ),
                    ],
                  ),
                  SizedBox(height: 10),
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
      
    ));
  }

  void _handleNavigationChange(int index) {
    switch (index) {
      case 0:
        // Get.to(CatelogProducts());
        // Navigate to home screen
        break;
      case 1:
        Get.to(BannerListTileExample());
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
  final player = AudioPlayer();
  final CartController controller;
  final Event eventobj;
  final int index;

  EventProductCard({
    Key? key,
    required this.controller,
    required this.eventobj,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          
          Container(
            height: 159,
            width: 260,
             decoration: BoxDecoration(
    color: Colors.white38,              
    borderRadius: BorderRadius.circular(25), 
  ),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.lightBlue,
                          Colors.lightGreen,
                        ],
                      ),
                    ),
                    
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/credenz.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    eventobj.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Bunaken",
                    ),
                  ),
                  //SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Amount : ${eventobj.price}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Bunaken",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            player.play(AssetSource("water-drop-85731.mp3"));
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
          Padding(padding: EdgeInsets.fromLTRB(4, 4, 0,4)),
          Container(
            
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white38,
            ),
            height: 159,
            width: 104,
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.lightBlue,
                          Colors.lightGreen,
                        ],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(Event.events[index].imageUrl),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: 5),
                 
                  //SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// return Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//   child: Row(
//     children: [
//       Expanded(
//         flex: 2,
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                   'assets/underwater-tropical-seabed-with-reef-sunshine_756748-1988.jpg'),
//               fit: BoxFit.fitWidth,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Card(
//             elevation: 0,
//             color: Colors.transparent,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Hero(
//                   tag: "event_${eventobj.name}",
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Colors.lightBlueAccent,
//                           Colors.lightBlue,
//                           Colors.lightGreen,
//                         ],
//                       ),
//                     ),
//                     child: CircleAvatar(
//                       radius: 35,
//                       backgroundImage:
//                           AssetImage("assets/credenz.png"),
//                       backgroundColor: Colors.transparent,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   eventobj.name,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "Bunaken",
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         "Amount : ${eventobj.price}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontFamily: "Bunaken",
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       IconButton(
//                         color: Colors.white,
//                         onPressed: () async {
//                           player.play(AssetSource("water-drop-85731.mp3"));
//                           controller.removeProduct(context, eventobj);
//                         },
//                         icon: Icon(Icons.remove_circle_outline_rounded),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       SizedBox(width: 10),
//       Expanded(
//         flex: 1,
//         child: Container(
//           height: 160,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                   'assets/underwater-tropical-seabed-with-reef-sunshine_756748-1988.jpg'),
//               fit: BoxFit.fitWidth,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Card(
//             elevation: 0,
//             color: Colors.transparent,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: 80,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.lightBlueAccent,
//                         Colors.lightBlue,
//                         Colors.lightGreen,
//                       ],
//                     ),
//                   ),
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage(eventobj.imageUrl),
//                     backgroundColor: Colors.transparent,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// );

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
