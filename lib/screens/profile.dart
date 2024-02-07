import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cart_page/controllers/events_controller.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventController eventController = Get.find<EventController>();

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/water.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              " PROFILE ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 20),
                CircularProfileAvatar(
                  '',
                  radius: 50,
                  backgroundColor: Colors.tealAccent,
                  borderWidth: 6,
                  initialsText: Text("Tanay"),
                  borderColor: Colors.yellowAccent,
                  elevation: 30.0,
                  foregroundColor: Colors.brown.withOpacity(0.5),
                  cacheImage: true,
                  imageFit: BoxFit.cover,
                  onTap: () {
                    print('Tanay');
                  },
                  showInitialTextAbovePicture: false,
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(Icons.person_pin_circle_sharp, size: 50),
                Text(
                  "Tanay Duddalwar",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 55),
                Icon(
                  Icons.email_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "tanay2duddalwar@gmail.com",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 55),
                Icon(
                  Icons.phone_in_talk_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "9309558432",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
            Text(eventController.techEvents.length.toString()),
            Expanded(
              child: ListView.builder(
                itemCount: eventController.techEvents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(eventController.techEvents[index].name),
                    onTap: () {
                      print('Tapped on ${eventController.techEvents[index].name}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
