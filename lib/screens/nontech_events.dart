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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimg/11.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.isNonTechnical.length,
          itemBuilder: (context, index) {
            final startDate =
                DateTime.parse(widget.isNonTechnical[index]['event_start']);
            final endDate =
                DateTime.parse(widget.isNonTechnical[index]['event_end']);
            final formattedStartDate =
                DateFormat.yMMMMd().add_jm().format(startDate);
            final formattedEndDate =
                DateFormat.yMMMMd().add_jm().format(endDate);

            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 0),
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
                        Color(0xff012554),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      widget.isNonTechnical[index]['event_name'],
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
                          'Price: ₹${widget.isNonTechnical[index]['event_cost']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'berky',
                          ),
                        ),
                        Text(
                          'Start: ${formattedStartDate}\nEnd: ${formattedEndDate}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'berky',
                          ),
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
