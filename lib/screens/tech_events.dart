import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/event_model.dart';
import 'package:intl/intl.dart';

class TechEventsPage extends StatefulWidget {
  final List<dynamic> isTechnical;

  TechEventsPage({required this.isTechnical});

  @override
  State<TechEventsPage> createState() => _TechEventsPageState();
}

class _TechEventsPageState extends State<TechEventsPage> {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bgimg/11.png'), fit: BoxFit.cover),
        ),
        child: ListView.builder(
  itemCount: widget.isTechnical.length,
  itemBuilder: (context, index) {
    final startDate = DateTime.parse(widget.isTechnical[index]['event_start']);
    final endDate = DateTime.parse(widget.isTechnical[index]['event_end']);
    final formattedStartDate = DateFormat.yMMMMd().add_jm().format(startDate);
    final formattedEndDate = DateFormat.yMMMMd().add_jm().format(endDate);

    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [ // Add a boxShadow for the white border effect
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff015db4),
                Color(0xff012554)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all( // Add white border
              color: Colors.white,
              width: 1,
            ),
          ),
          child: ListTile(
            title: Text(
              widget.isTechnical[index]['event_name'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'berky',
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price: ₹${widget.isTechnical[index]['event_cost']}',
                  style: TextStyle(color: Colors.white, fontFamily: 'berky'),
                ),
                Text(
                  'Start: ${formattedStartDate}\nEnd: ${formattedEndDate}',
                  style: TextStyle(color: Colors.white, fontFamily: 'berky'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
),

      ),
    );
  }
}
