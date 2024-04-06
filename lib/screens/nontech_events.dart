import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/event_model.dart';

class NonTechEventsPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cartController.nonTechEvents.length,
        itemBuilder: (context, index) {
          Event event = cartController.nonTechEvents.keys.toList()[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage( image: AssetImage ('assets/bgimg/9.png'), fit: BoxFit.cover),
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.teal], // Adjust colors as needed
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(
                  event.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price: \Rs.${event.price.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Duration: ${event.duration}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
