// import 'package:cart_page/controllers/events_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:cart_page/controllers/cart_controller.dart';
//  // Import your Event model here

// class EventProductCard extends StatelessWidget {
//   final CartController controller;
//   final Event eventobj;
//   final int index;

//   const EventProductCard({
//     Key? key,
//     required this.controller,
//     required this.eventobj,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/cardback.jpg'),
//             fit: BoxFit.fitWidth,
//           ),
//         ),
//         height: 160,
//         child: Card(
//           elevation: 50,
//           color: Colors.white54,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               CircleAvatar(
//                 radius: 23,
//                 backgroundColor: Colors.black,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 eventobj.name,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     "Amount: ${eventobj.price}", // Assuming you want to display the price
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () async {
//                       controller.removeProduct(context, eventobj);
//                     },
//                     icon: Icon(Icons.remove_circle_outline_rounded),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Now, you can use this class within a ListView like this:

// ListView.builder(
//   itemCount: events.length, // Assuming 'events' is your list of Event objects
//   itemBuilder: (context, index) {
//     final event = events[index];
//     return EventProductCard(
//       controller: yourCartControllerInstance,
//       eventobj: event,
//       index: index,
//     );
//   },
// )
