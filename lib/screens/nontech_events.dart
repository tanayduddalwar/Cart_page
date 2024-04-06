import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/event_model.dart';
import 'package:intl/intl.dart';
class NonTechEventsPage extends StatefulWidget {
  final List<dynamic> isNonTechnical;

  NonTechEventsPage({required this.isNonTechnical});

  @override
  State<NonTechEventsPage> createState() => _NonTechEventsPageState();
}

class _NonTechEventsPageState extends State<NonTechEventsPage> {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.isNonTechnical.length, // Access isTechnical from widget
        itemBuilder: (context, index) {
             final startDate = DateTime.parse(widget.isNonTechnical[index]['event_start']);
        final endDate = DateTime.parse(widget.isNonTechnical[index]['event_end']);
        final formattedStartDate = DateFormat.yMMMMd().add_jm().format(startDate);
        final formattedEndDate = DateFormat.yMMMMd().add_jm().format(endDate);

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.teal], // Adjust colors as needed
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(
                  widget.isNonTechnical[index]['event_name'],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price: ₹${widget.isNonTechnical[index]['event_cost']}', // Fixed the syntax here
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Start: ${formattedStartDate}\nEnd: ${formattedEndDate}',
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
