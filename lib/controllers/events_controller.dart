import 'package:get/get.dart';

class Event {
  final String name;

  Event(this.name);
}

class EventController extends GetxController {
  List<Event> techEvents = [
    Event("Clash"),
    Event('Enigma'),
    Event('RC'),
    Event('Datawiz'),
    Event('Cretonix'),
    Event('Web Weaver'),
    Event('Credenz'),
  ];
  List<Event> nontechEvents = [
    Event("Network Treasure Hunt"),
    Event("Wall Street"),
    Event('B-Plan'),
    Event('Enigma'),
    Event('Quiz')
  ];

  // Getter method to retrieve the names of the events as a list of strings
  List<String> get techeventNames {
    return techEvents.map((event) => event.name).toList();
  }
   List<String> get noneventNames {
    return nontechEvents.map((event) => event.name).toList();
  }
}
