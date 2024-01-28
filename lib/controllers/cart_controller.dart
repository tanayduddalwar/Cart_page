import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/event_model.dart';

class CartController extends GetxController {
  var _events = {}.obs;

  void addProduct(Event eventobj) {
    if (_events.containsKey(eventobj)) {
      Get.snackbar(
        'Event is already added',
        'Please select another event',
        snackPosition: SnackPosition.BOTTOM,
        borderColor: Colors.purple,
        borderWidth: 4,
        isDismissible: true,
        forwardAnimationCurve: Curves.bounceInOut,
        duration: Duration(milliseconds: 1200),
      );
    } else {
      _events[eventobj] = 1;
    }
  }

  get events => _events;

  void removeProduct(Event eventobj){
    if(_events.containsKey(eventobj) && _events[eventobj]==1){
      _events.removeWhere((key, value) => key==eventobj);
    }
    else{
      Get.snackbar(
        'Event is already removed',
        '',
        snackPosition: SnackPosition.BOTTOM,
        borderColor: Colors.purple,
        borderWidth: 4,
        isDismissible: true,
        forwardAnimationCurve: Curves.bounceInOut,
        duration: Duration(milliseconds: 1200),);
    }
  }

  double get eventSubtotal =>
      _events.entries.map((eventobj) => eventobj.key.price).toList().reduce((a, b) => a + b);

  String get total => eventSubtotal.toStringAsFixed(2);
}
