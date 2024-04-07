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
import 'package:cart_page/firebase_options.dart';
import 'package:cart_page/landing_page/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
      home: SplashScreen(),
    );
  }
}
