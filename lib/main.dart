import 'package:cart_page/screens/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
    runApp(GetMaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return MaterialApp(
            theme:ThemeData(
                primarySwatch:Colors.blue),
            home:EventsScreen(),
        );
    }
}