import 'package:audioplayers/audioplayers.dart';
import 'package:cart_page/eventpage/specific_event%20(1).dart';
import 'package:cart_page/eventpage/swipeable_content.dart';
import 'package:cart_page/screens/aboutus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import '../controllers/cart_controller.dart';
import '../models/event_model.dart';

class CatelogProducts extends StatelessWidget {
  const CatelogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: ListView.builder(
          itemCount: Event.events.length,
          itemBuilder: (BuildContext context, int index) {
            return CatelogProductCard(index: index);
            ElevatedButton(
              onPressed: () {
                Get.to(AboutUs());
              },
              child: Text("About Us"),
            );
          },
        ),
      ),
    );
    // ElevatedButton(
    //   onPressed: () {
    //     Get.to(AboutUs());
    //   },
    //   child: Text("About Us"),
    // );
  }
}

class CatelogProductCard extends StatelessWidget {
  final player = AudioPlayer();
  final CartController cartController = Get.put(CartController());
  final int index;

  CatelogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipPath(
        //  clipper: Clip1Clipper(),
        child: Container(
          margin: EdgeInsets.all(5),
          height: 170,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/cardback.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              Get.to(SwipeableContent(event: Event.events[index]));
            },
            child: Card(
              color: Colors.white38,
              elevation: 5, // Adding elevation for a shadow effect
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15), // Same border radius here
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          // Colors.lightBlueAccent,
                          Colors.lightBlue,
                          Colors.lightGreen,
                        ],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(Event.events[index].imageUrl),
                      backgroundColor:
                          Colors.transparent, // Make background transparent
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      Event.events[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Price: ${Event.events[index].price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      AnimatedButton(
                        height: 50,
                        width: 110,
                        animatedOn: AnimatedOn.onHover,
                        onPress: () {
                          player.play(AssetSource(
                              "waves-149581-[AudioTrimmer.com].mp3"));
                        },
                        text: 'ADD',
                        isReverse: true,
                        selectedTextColor: Colors.white70,
                        transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        gradient: LinearGradient(colors: [
                          Colors.tealAccent,
                          Colors.lightBlueAccent
                        ]),
                        selectedGradientColor: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.purpleAccent]),
                        backgroundColor: Colors.lightBlueAccent,
                        borderColor: Colors.white,
                        selectedBackgroundColor: Colors.lightGreen,
                        borderRadius: 30,
                        borderWidth: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
