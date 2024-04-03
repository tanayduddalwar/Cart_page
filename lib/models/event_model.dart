import 'package:flutter/material.dart';

class Event {
  final String name;
  final double price;
  final String imageUrl;
  final String duration;
  final bool isTechnical;
  final String description;
  final String rules;
  final String schedule;
  final String contact; // New field to indicate if the event is technical

  Event({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.duration,
    required this.isTechnical,
    required this.description,
    required this.rules,
    required this.schedule,
    required this.contact,
    // Initialize isTechnical in the constructor
  });

  static List<Event> events = [
    
    Event(
      name: 'RC',
      price: 50,
      imageUrl: 'assets/RC.png',
      duration: '30',
      isTechnical: true,
      description:
          'A coding competition to test your conceptual understanding of algorithms and programming languages. Combine logic and agility to decipher given patterns and code to decode these sequences to find the final answer.',
      schedule:
          'Round 1 (Slot 1): 12th May 2023, 10:00 AM to 6:00 PM Round 1 (Slot 2): 13th May 2023, 10:00 AM to 6:00 PM '
          'Round 2: 14th May 2023, 11:30 AM to 1:30 PM',
      rules:
          '1.Integer type questions which involve complex mathematical problems which are not easy to solve without coding. 2.A 30-minute game for a person or a team of two people. 3.Teams or players are allowed to use any IDE or software after the game has started. 4.You will have 3 lifelines (description will be provided in the game itself).You are not allowed to switch tabs or close the browser during the game. If you do so, you will be logged out automatically 6.You will have two attempts to answer a particular question. In the first attempt, the marking scheme will be +4 0. In the second attempt, the marking scheme will be changed to +2 -2.',
      contact:
          'Sarvesh Varade 8788013967 Vansh Teppalwar 7972851721', // Set it as non-technical
    ),
    Event(
      name: 'WebWeaver',
      price: 50,
      imageUrl: 'assets/webweaver.png',
      duration: '30',
      isTechnical: true,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact',
      // Set it as non-technical
    ),
    Event(
      name: 'Clash',
      price: 40,
      imageUrl: 'assets/Clash.png',
      duration: '50',
      isTechnical: true,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact', // Set it as non-technical
    ),
     Event(
      name: 'Roboliga',
      price: 20,
      imageUrl: 'assets/roboliga.png',
      duration: '30',
      isTechnical: true,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact',
      // Set it as non-technical
    ),
    
    Event(
      name: 'DataWiz',
      price: 30,
      imageUrl: 'assets/datawiz.png',
      duration: '230',
      isTechnical: true,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact', // Set it as technical
    ),
    Event(
      name: 'Cretonix',
      price: 30,
      imageUrl: 'assets/cretronix.png',
      duration: '320',
      isTechnical: true,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact', // Set it as technical
    ),
    Event(
      name: 'Wall Street',
      price: 60,
      imageUrl: "assets/wallstreet.png",
      duration: '2:00',
      isTechnical: false,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact',

      // Set it as technical
    ),
    Event(
      name: 'Enigma',
      price: 50,
      imageUrl: 'assets/enigma.png',
      duration: '130',
      isTechnical: false,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact', // Set it as non-technical
    ),
    
    Event(
      name: 'B-Plan',
      price: 50,
      imageUrl: 'assets/bplan.png',
      duration: '30',
      isTechnical: false,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact',
      // Set it as non-technical
    ),
    Event(
      name: 'Nth',
      price: 20,
      imageUrl: 'assets/nth.png',
      duration: '30',
      isTechnical: false,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact',
      // Set it as non-technical
    ),
    Event(
      name: 'Quiz',
      price: 20,
      imageUrl: 'assets/webweaver.png',
      duration: '30',
      isTechnical: false,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact',
      // Set it as non-technical
    ),
   
    Event(
      name: 'Xodia',
      price: 40,
      imageUrl: 'assets/xodia.png',
      duration: '50',
      isTechnical: false,
      description: 'Event Description',
      schedule: 'schedule',
      rules: 'rules',
      contact: 'contact', // Set it as non-technical
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
