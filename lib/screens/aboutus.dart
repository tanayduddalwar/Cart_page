import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: Text("Developers"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/4.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCard(
                  name: "CREDENZ USER 1",
                  email: "user1@example.com",
                  icon: Icons.mail_outlined,
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                CustomCard(
                  name: "CREDENZ USER 2",
                  email: "user2@example.com",
                  icon: Icons.mail_outlined,
                  onPressed: () async {
                    await launchUrl(Uri.parse("mailto:user2@example.com"));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String name;
  final String email;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomCard({
    Key? key,
    required this.name,
    required this.email,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width / 2.2,
      child: Card(
        color: Colors.white54,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: WidgetCircularAnimator(
               // innerAnimation: Curves.easeInQuart,

              //  innerColor: Colors.tealAccent,
          // outerAnimation: Curves.linear,
           singleRing: false,
           innerIconsSize: 7,

           //reverse: true,
           //size:250 ,
                child: Container(
                   // Height of the container
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                     border:Border.all(color: Colors.blue) ,
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("assets/tanay.jpg"),
                      fit: BoxFit.scaleDown, // Adjust the fit as needed
                    ),
                  ),
                  // child: Icon(
                  //   Icons.person_outline,
                  //   color: Colors.deepOrange[200],
                  //   size: 60,
                  // ),
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(icon),
                ),
                 IconButton(
                  onPressed: onPressed,
                  icon: Icon(Icons.email),
                ),
              ],
            )
          ],
        ),
        elevation: 10,
      ),
    );
  }
}
