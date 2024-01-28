import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/cart_products.dart';
import '../widgets/event_product.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events Catelog")),
      body: SafeArea(child: Column(children: [
        CatelogProducts(),
        ElevatedButton(onPressed: ()=>Get.to(()=>EventProducts(),duration: Duration(seconds:0)), child: Text("Go to Cart")),
        
      ],)),
      
    );
  }
}