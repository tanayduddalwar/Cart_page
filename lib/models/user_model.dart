import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile {
  String username;
  String fullName;
  String email;
  String phone;
  bool senior;
  String institute;
  int coins;
  String referral;
  List<Order> orders;
  bool offlineOfficer;
  bool isAdmin;
  bool isSuperuser;

  Profile({
    required this.username,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.senior,
    required this.institute,
    required this.coins,
    required this.referral,
    required this.orders,
    required this.offlineOfficer,
    required this.isAdmin,
    required this.isSuperuser,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      username: json["username"],
      fullName: json["full_name"],
      email: json["email"],
      phone: json["phone"],
      
      senior: json["senior"],
      institute: json["institute"],
      coins: json["coins"],
      referral: json["referral"],
      orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      offlineOfficer: json["offline_officer"],
      isAdmin: json["is_admin"],
      isSuperuser: json["is_superuser"],
    );
  }

  static Future<Profile> fetchProfile() async {
    final response =
        await http.get(Uri.parse('https://admin.credenz.in/api/events'));
    if (response.statusCode == 200) {
      print(response.body);
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }
}

class Order {
  int id;
  User user;
  Event event;
  DateTime orderDate;
  String payment;
  String orderTaker;
  String transactionId;

  Order({
    required this.id,
    required this.user,
    required this.event,
    required this.orderDate,
    required this.payment,
    required this.orderTaker,
    required this.transactionId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json["id"],
      user: User.fromJson(json["user"]),
      event: Event.fromJson(json["event"]),
      orderDate: DateTime.parse(json["order_date"]),
      payment: json["payment"],
      orderTaker: json["order_taker"],
      transactionId: json["transaction_id"],
    );
  }
}

class Event {
  int id;
  String eventName;
  String eventDescription;
  String eventId;
  DateTime eventStart;
  DateTime eventEnd;
  bool groupEvent;
  int groupSize;
  String eventRules;
  String eventStructure;
  int eventCost;
  String eventPo;
  String eventCo;

  Event({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.eventId,
    required this.eventStart,
    required this.eventEnd,
    required this.groupEvent,
    required this.groupSize,
    required this.eventRules,
    required this.eventStructure,
    required this.eventCost,
    required this.eventPo,
    required this.eventCo,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        eventName: json["event_name"],
        eventDescription: json["event_description"],
        eventId: json["event_id"],
        eventStart: DateTime.parse(json["event_start"]),
        eventEnd: DateTime.parse(json["event_end"]),
        groupEvent: json["group_event"],
        groupSize: json["group_size"],
        eventRules: json["event_rules"],
        eventStructure: json["event_structure"],
        eventCost: json["event_cost"],
        eventPo: json["event_po"],
        eventCo: json["event_co"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_name": eventName,
        "event_description": eventDescription,
        "event_id": eventId,
        "event_start": eventStart.toIso8601String(),
        "event_end": eventEnd.toIso8601String(),
        "group_event": groupEvent,
        "group_size": groupSize,
        "event_rules": eventRules,
        "event_structure": eventStructure,
        "event_cost": eventCost,
        "event_po": eventPo,
        "event_co": eventCo,
      };
}

class User {
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  dynamic referralCode;
  bool senior;
  String institute;

  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.referralCode,
    required this.senior,
    required this.institute,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        referralCode: json["referralCode"],
        senior: json["senior"],
        institute: json["institute"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "referralCode": referralCode,
        "senior": senior,
        "institute": institute,
      };
}
