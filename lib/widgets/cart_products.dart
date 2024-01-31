import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.events.length,
                itemBuilder: (BuildContext context, int index) => EventProductCard(
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
                      // Add your logic to navigate to the payment screen
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
    );
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
            backgroundColor: Colors.blue,
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
      color: Colors.grey[200],
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
