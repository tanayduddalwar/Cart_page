import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("About Us"),
        centerTitle: true,
        elevation: 1.2,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  SizedBox(height: 5);
                  return CustomListTile(); // Calling custom list tile
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.tealAccent,
                    child: Container(
                      width: 160, // Width of the container
                      height: 160, // Height of the container
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/tanay.jpg"),
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Tanay Duddalwar")],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.phone_android_outlined)),
                    IconButton(
                        onPressed: () async {
                          launchUrl(
                              Uri.parse("mailto:tanay2duddalwar@gmail.com"));
                        },
                        icon: Icon(Icons.mail_outlined)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                  ],
                )
              ],
            ),
            // child: Center(child: Text("Hello")),
            elevation: 15,
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
