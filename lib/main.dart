// import 'package:cart_page/controllers/events_controller.dart';
// import 'package:cart_page/screens/event_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: EventsScreen(),
//       initialBinding: InitialBindings(),
//     );
//   }
// }

// class InitialBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<EventController>(() => EventController());
//   }
// }
import 'package:cart_page/Sponsers/sponsers.dart';
import 'package:cart_page/about/about.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/firebase_options.dart';
import 'package:cart_page/landing_page/nontech.dart';
import 'package:cart_page/landing_page/splash_screen.dart';
import 'package:cart_page/landing_page/tech.dart';
import 'package:cart_page/ping_page/ping.dart';

import 'package:cart_page/screens/privacy_content.dart';
import 'package:cart_page/screens/profile.dart';
import 'package:cart_page/widgets/cart_products.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}

