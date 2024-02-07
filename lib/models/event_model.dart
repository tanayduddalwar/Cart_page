import 'package:flutter/material.dart';

class Event {
  final String name;
  final double price;
  final String imageUrl;
  final String duration;
  final bool isTechnical; // New field to indicate if the event is technical

  const Event({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.duration,
    required this.isTechnical, // Initialize isTechnical in the constructor
  });

  static const List<Event> events = [
    Event(
      name: 'Wall Street',
      price: 60,
      imageUrl: '',
      duration: '2:00',
      isTechnical: false, // Set it as technical
    ),
    Event(
      name: 'RC',
      price: 50,
      imageUrl: '',
      duration: '30',
      isTechnical: true, // Set it as non-technical
    ),
    Event(
      name: 'Clash',
      price: 40,
      imageUrl: '',
      duration: '50',
      isTechnical: true, // Set it as non-technical
    ),
    Event(
      name: 'DataWiz',
      price: 30,
      imageUrl: '',
      duration: '230',
      isTechnical: true, // Set it as technical
    ),
    Event(
      name: 'Cretonix',
      price: 30,
      imageUrl: '',
      duration: '320',
      isTechnical: true, // Set it as technical
    ),
    Event(
      name: 'Enigma',
      price: 50,
      imageUrl: '',
      duration: '130',
      isTechnical: false, // Set it as non-technical
    ),
  ];
}
