import 'package:cart_page/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/event_model.dart';
// Import the Model class
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CartController extends GetxController {
  var _events = {}.obs;
  var _techEvents = {}.obs;
  var _nonTechEvents = {}.obs;
  List<int> EventIndex = [];

  RxMap get events => _events;
  RxMap get techEvents => _techEvents;
  RxMap get nonTechEvents => _nonTechEvents;

  void addProduct(BuildContext context, Event eventobj) {
    if (!_events.containsKey(eventobj)) {
      int eventId = eventobj.id;
      print(eventId); // Accessing the id property of eventobj
      EventIndex.add(eventId);
      // final snackBar = SnackBar(
      //   elevation: 5,
      //   behavior: SnackBarBehavior.floating,
      //   duration: Duration(seconds: 3),
      //   backgroundColor: Colors.transparent,
      //   content: AwesomeSnackbarContent(
      //     title: 'Ready To Go !',
      //     message: 'Event Added To Cart!',
      //     contentType: ContentType.success,
      //   ),
      // );

      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    // Determine if the event is technical or non-technical
    if (_events.containsKey(eventobj)) {
      final snackBar = SnackBar(
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Ready to sail !',
          message: 'Event Already Added To Cart!',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      _events[eventobj] = 1;
      // Add event to the appropriate dictionary based on its type
      if (eventobj.isTechnical) {
        _techEvents[eventobj] = 1;
      }
      if (!eventobj.isTechnical) {
        _nonTechEvents[eventobj] = 1;
      }
    }
    print(EventIndex);
  }

  void removeProduct(BuildContext context, Event eventobj) {
    if (_events.containsKey(eventobj)) {
      if (_events.length == 0) {
        final snackBar = SnackBar(
          elevation: 5,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Ready to sail !',
            message: 'Event Already Added To Cart!',
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else {
        int eventId = eventobj.id; // Accessing the id property of eventobj
        EventIndex.remove(eventId);
        if (eventobj.isTechnical) {
          _techEvents.remove(eventobj);
        } else {
          _nonTechEvents.remove(eventobj);
        }
        _events.remove(eventobj);
        if (_events.isEmpty) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EmptyCart()));
        }

        // Determine the type of event and remove it from the appropriate dictionary

        final snackBar = SnackBar(
          elevation: 5,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Event Offloaded !',
            message: 'Event Removed From Cart!',
            contentType: ContentType.warning,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    } else {
      Get.snackbar(
        'Event is already removed',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderColor: Colors.purple,
        borderWidth: 4,
        isDismissible: true,
        forwardAnimationCurve: Curves.bounceInOut,
        duration: Duration(milliseconds: 1200),
      );
    }
  }

  double get eventSubtotal => _events.entries
      .map((eventobj) => eventobj.key.price)
      .toList()
      .reduce((a, b) => a + b);

  String get total => eventSubtotal.toStringAsFixed(2);
}
