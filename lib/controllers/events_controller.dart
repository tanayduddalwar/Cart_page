import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Event {
  final String name;

  Event(this.name);
}

class EventController extends GetxController {
  var _events = {}.obs;
  var techEvents = {}.obs;
  var nonTechEvents = {}.obs;

  void addProduct(BuildContext context, Event eventobj) {
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

      // Check if the event is a tech event or non-tech event and add it accordingly
      if (techEvents.values.toSet().contains(eventobj.name)) {
        techEvents[eventobj] = 1;
      } else if (nonTechEvents.values.toSet().contains(eventobj.name)) {
        nonTechEvents[eventobj] = 1;
      }

      // Update the state of the controller
      update();
    }
  }

  void removeProduct(BuildContext context, Event eventobj) {
    if (_events.containsKey(eventobj)) {
      _events.remove(eventobj);

      // Check if the event is a tech event or non-tech event and remove it accordingly
      if (techEvents.values.toSet().contains(eventobj.name)) {
        techEvents.removeWhere((key, value) => key.name == eventobj.name);
      } else if (nonTechEvents.values.toSet().contains(eventobj.name)) {
        nonTechEvents.removeWhere((key, value) => key.name == eventobj.name);
      }

      // Update the state of the controller
      update();

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
      .map((eventobj) => eventobj.key.name.length)
      .toList()
      .reduce((a, b) => a + b);

  String get total => eventSubtotal.toStringAsFixed(2);
}