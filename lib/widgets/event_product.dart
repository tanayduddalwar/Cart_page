import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/cart_controller.dart';
import '../controllers/cart_controller.dart';
import '../models/event_model.dart';

class CatelogProducts extends StatelessWidget {
  const CatelogProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
      itemCount: Event.events.length,
      itemBuilder: (BuildContext context, int index) {
        return CatelogProductCard(index: index);
      },
    ));
  }
}

class CatelogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;
  CatelogProductCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(Event.events[index].imageUrl),
          ),
          SizedBox(width: 20),
          Expanded(child: Text(Event.events[index].name)),
          SizedBox(width: 20),
          Expanded(
            child: Text('${Event.events[index].price}'),
          ),
          IconButton(
              onPressed: () {
                cartController.addProduct(Event.events[index]);
              },
              icon: Icon(
                Icons.add_circle,
              ))
        ]));
  }
}
