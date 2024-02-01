import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';
import '../widgets/cart_products.dart';
import '../widgets/event_product.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events Catelog"),
      centerTitle: true,
      backgroundColor: Colors.lightBlue),
      body: SafeArea(
          child: Column(
        children: [
          CatelogProducts(),
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
      )),
    );
  }
}
