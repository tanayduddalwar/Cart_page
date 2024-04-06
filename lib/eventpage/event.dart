import 'package:flutter/material.dart';

class Event{
 const Event({
   required this.title,
   required this.category,
   required this.description,
   required this.schedule,
   required this.rules,
   required this.contact,
   required this.color,
   required this.imageUrl,
});

 final String imageUrl;
 final Color color;
 final String title;
 final String category;
 final String description;
 final String schedule;
 final String rules;
 final String contact;

}