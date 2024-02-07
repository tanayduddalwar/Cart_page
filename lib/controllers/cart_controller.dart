import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/event_model.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CartController extends GetxController {
  var _events = {}.obs;

  RxMap get events => _events;

  void addProduct(BuildContext context, Event eventobj) {
    if (_events.containsKey(eventobj)) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        //animation: CurvedAnimation(parent:Curves.bounceInOut, curve: curve),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Ready to sail !',
          message: 'Event Already Added To Cart!',
          // inMaterialBanner: false,

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      _events[eventobj] = 1;
    }
  }

  void removeProduct(BuildContext context, Event eventobj) {
    if (_events.containsKey(eventobj)) {
      if (_events.length == 0) {
        final snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 5,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          //animation: CurvedAnimation(parent:Curves.bounceInOut, curve: curve),
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Ready to sail !',
            message: 'Event Already Added To Cart!',
            // inMaterialBanner: false,

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        // Get.back();
        // // If there is only one item in the cart
        // _events.clear();
        // Get.snackbar(
        //   'Cart is empty',
        //   'Event removed from cart',
        //   snackPosition: SnackPosition.BOTTOM,
        //   borderColor: Colors.amber,
        //   borderWidth: 4,
        //   isDismissible: true,
        //   forwardAnimationCurve: Curves.bounceInOut,
        //   duration: Duration(milliseconds: 1200),
        // );
        // Get.back(); // Navigate back to the old screen
      } else {
        _events.remove(eventobj);
        final snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 5,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          //animation: CurvedAnimation(parent:Curves.bounceInOut, curve: curve),
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Event Offloaded !',
            message: 'Event Removed From Cart!',
            // inMaterialBanner: false,

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.warning,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar); // Remove the specified event
        // Get.snackbar(
        //   'Event removed from cart',
        //   '',
        //   snackPosition: SnackPosition.BOTTOM,
        //   borderColor: Colors.amber,
        //   borderWidth: 4,
        //   isDismissible: true,
        //   forwardAnimationCurve: Curves.bounceInOut,
        //   duration: Duration(milliseconds: 1200),
        // );
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