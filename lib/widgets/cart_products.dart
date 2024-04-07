import 'package:cart_page/eventpage/specific_event%20(1).dart';
import 'package:cart_page/eventpage/swipeable_content.dart';
import 'package:cart_page/screens/about.dart';
import 'package:cart_page/screens/payment.dart';
import 'package:cart_page/screens/profile.dart';
import 'package:cart_page/widgets/cart_total.dart';
import 'package:cart_page/widgets/empty_cart.dart';
import 'package:cart_page/widgets/event_product.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import 'package:super_banners/super_banners.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sliding_widget/sliding_widget.dart';
import 'package:badges/badges.dart' as badges;
import '../controllers/cart_controller.dart';
import '../models/event_model.dart';

class EventProducts extends StatelessWidget {
  final CartController controller = Get.find();

  EventProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.events.length == 0) {
        return EmptyCart();
      } else {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bgimg/5.png"),
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
                              title: Text(
                                "CART",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "berky",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListView.builder(
                            itemCount: controller.events.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                              margin: EdgeInsets.symmetric(vertical: 3.0),
                              padding: const EdgeInsets.all(8.0),
                              child: EventProductCard(
                                controller: controller,
                                eventobj:
                                    controller.events.keys.toList()[index],
                                index: index,
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
                              label: 'Payment',
                              labelStyle:
                                  TextStyle(fontFamily: 'berky', fontSize: 25),
                              shadow: const BoxShadow(color: Colors.red),
                              action: () {
                                Get.to(() => Payment());
                              },
                              child: const Icon(Icons.arrow_forward_ios),
                              stickToEnd: false,
                            ),
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
        );
      }
    });
  }
}

class EventProductCard extends StatelessWidget {
  //final player = AudioPlayer();
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Get.to(SpecificPage(event: eventobj));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 3),
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
                          // backgroundImage: AssetImage("assets/credenz.png"),
                          backgroundImage: AssetImage(eventobj.imageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(height: 3),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            eventobj.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "berky",
                            ),
                          ),
                          Text(
                            " ${eventobj.price}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "berky",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.white,
                        onPressed: () async {
                          controller.removeProduct(context, eventobj);
                          if (controller.events.length == 0) {
                            Get.off(() => EmptyCart());
                          }
                        },
                        icon: Icon(Icons.remove_circle_outline_rounded),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.1),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white38,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 12),
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black,
                                Colors.white
                                // Colors.lightBlueAccent,
                                // Colors.lightBlue,
                                // Colors.lightGreen,
                              ],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/images/Credenz.png"),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -25, // Adjust the position as needed
                  right: -18, // Adjust the position as needed
                  child: CornerBanner(
                    bannerPosition: CornerBannerPosition.topRight,
                    bannerColor: Colors.teal,
                    child: SizedBox(
                      width: 100, // Adjust the size of the banner as needed
                      height: 20, // Adjust the size of the banner as needed
                      child: Center(
                        child: Text(
                          eventobj.isTechnical ? "Tech" : "Non tech",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
