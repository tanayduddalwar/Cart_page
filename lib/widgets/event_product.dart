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
  final CartController cartController = Get.put(CartController());
  final int index;

  CatelogProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(Event.events[index].imageUrl),
            backgroundColor: Colors.black,
          ),
          SizedBox(width: 20),
          Expanded(child: Text(Event.events[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
          SizedBox(width: 20),
          Expanded(
            child: Text('${Event.events[index].price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          AnimatedButton(
            height: 55,
            width: 110,
            animatedOn: AnimatedOn.onHover,
            onPress: () {
              cartController.addProduct(Event.events[index]);
            },
            text: 'ADD',
            isReverse: true,
            selectedTextColor: Colors.white,
            transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            gradient: LinearGradient(colors: [Colors.tealAccent, Colors.lightBlueAccent]),
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
    );
  }
}
