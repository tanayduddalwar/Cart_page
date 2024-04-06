import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';

class BannerListTileExample extends StatelessWidget {
  const BannerListTileExample({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/credenz24.jpeg"), fit: BoxFit.cover)

            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [Colors.blue, Colors.amber], // Change these colors as desired
            // ),

            ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppBar(
                title: Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Adjust this as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BannerListTile(
                      bannerIcon: Icon(Icons.launch_outlined),
                      backgroundColor: Colors.amber.shade200,
                      borderRadius: BorderRadius.circular(8),
                      height: 150,

                      // bannerPosition: BannerPosition.topLeft,
                      imageContainer: Image(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb1.2.1&auto=format&fit=crop&w=387&q=80"),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        "Lisa",
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Column(
                        children: [
                          Text("Hello"),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.phone)),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.mail)),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.abc)),
                            ],
                          ),
                        ],
                      ),
                      // trailing: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       Icons.delete_forever,
                      //       color: Colors.red,
                      //     )),
                    ),
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
