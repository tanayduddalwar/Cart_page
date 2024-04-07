import 'package:cart_page/Buzzer/buzzerscreen.dart';
import 'package:cart_page/landing_page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final BuzzerController buzzerController = Get.put(BuzzerController());
  RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
  String enteredPin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => HomePage());
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "QUIZ",
          style:
              TextStyle(fontFamily: "berky", color: Colors.white, fontSize: 30),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/bgimg/12.png',
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter the Name of your team",
                style: TextStyle(
                    fontFamily: "berky", fontSize: 25, color: Colors.white),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(),
                  controller: buzzerController.teamcontroller,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "Enter the PIN to start QUIZ",
                style: TextStyle(
                    fontFamily: "berky", fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              OTPTextField(
                style: TextStyle(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.8,
                fieldWidth: MediaQuery.of(context).size.width * 0.1,
                length: 4,
                onCompleted: (text) {
                  if (text == '4797') {
                    if (regex.hasMatch(text)) {
                      print("GOOD");
                      Get.to(() => BuzzerScreen());
                    }
                  } else {
                    Get.snackbar("Invalid Code", "Error");
                    setState(() {
                      enteredPin = '';
                    });
                  }
                },
                onChanged: (text) {
                  setState(() {
                    enteredPin = text;
                  });
                },
                otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Colors.transparent,
                    focusBorderColor: Colors.white,
                    enabledBorderColor: Colors.green),
                fieldStyle: FieldStyle.underline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
