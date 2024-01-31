import 'package:flutter/material.dart';


class Event{
    final String name;
    final double price;
    final String imageUrl;
    final String duration;
    const Event({
        required this.name,
        required this.price,
        required this.imageUrl,
        required this.duration,
    });

    static const List<Event> events=[
        Event(
            name:'Wall Street',
            price:60,
            imageUrl :'',
            duration:'2:00'),
        Event(
            name: 'RC', 
            price: 50, 
            imageUrl: "", 
            duration: "30"),
        Event(
            name: 'Clash', 
            price: 40, 
            imageUrl: "", 
            duration: "50"),
        Event(
            name: 'DataWiz', 
            price: 30, 
            imageUrl: "", 
            duration: "230"),
        Event(
            name: 'Cretonix', 
            price: 30, 
            imageUrl: "", 
            duration: "320"),
        Event(
            name: 'Enigma', 
            price: 50, 
            imageUrl: "", 
            duration: "130"),
        ]; 

}