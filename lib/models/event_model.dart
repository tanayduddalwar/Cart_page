import 'package:flutter/material.dart';

class Event {
  final String name;
  final double price;
  final String imageUrl;
  final String duration;
  final bool isTechnical; // New field to indicate if the event is technical

  Event({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.duration,
    required this.isTechnical, // Initialize isTechnical in the constructor
  });

  static List<Event> events = [
    Event(
      name: 'Wall Street',
      price: 60,
      imageUrl: "assets/wallstreet.png",
      duration: '2:00',
      isTechnical: false, // Set it as technical
    ),
    Event(
      name: 'RC',
      price: 50,
      imageUrl: 'assets/RC.png',
      duration: '30',
      isTechnical: true, // Set it as non-technical
    ),
    Event(
      name: 'Clash',
      price: 40,
      imageUrl: 'assets/Clash.png',
      duration: '50',
      isTechnical: true, // Set it as non-technical
    ),
    Event(
      name: 'DataWiz',
      price: 30,
      imageUrl: 'assets/datawiz.png',
      duration: '230',
      isTechnical: true, // Set it as technical
    ),
    Event(
      name: 'Cretonix',
      price: 30,
      imageUrl: 'assets/cretronix.png',
      duration: '320',
      isTechnical: true, // Set it as technical
    ),
    Event(
      name: 'Enigma',
      price: 50,
      imageUrl: 'assets/enigma.png',
      duration: '130',
      isTechnical: false, // Set it as non-technical
    ),
    Event(
      name: 'WebWeaver',
      price: 50,
      imageUrl: 'assets/webweaver.png',
      duration: '30',
      isTechnical: true, // Set it as non-technical
    ),
  ];
  // static Event fromSnapshot(DocumentSnapshot snap) {
  //   Event event = Event(
  //       name: snap["name"],
  //       price: snap["price"],
  //       imageUrl: snap["url"],
  //       duration: snap["time"],
  //       isTechnical: snap["istechnical"]);
  // }
}
