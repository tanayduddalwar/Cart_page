
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:card_swiper/card_swiper.dart';


class ui extends StatelessWidget {
  final devimages = <String>[
    'assets/images/head.jpeg',
    'assets/images/dev4.jpeg',
    'assets/images/dev7.jpeg',
    'assets/images/dev6.jpg',
    'assets/images/dev5.jpeg',
    'assets/images/dev1.jpg',
    'assets/images/dev2.jpg',
    'assets/images/dev3.jpg',
    'assets/images/dev9.jpg',
  ];
  static List<String> names = [
    'Tanmay Thanvi',
    'Omkar Wagholikar',
    'Ameya Surana',
    'Chinmay Dixit',
    'Niraj Zargad',
    'Aarya Patil',
    'Swapnil Adsul',
    'Dhruv Goplani',
    'Ritanshu Koul',
  ];
  static List<String> description = [
    'Technical Head',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
  ];
  ui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 200),
          SizedBox(
              height: 450,
              child: Swiper(
                itemCount: 9,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white24,
                      activeColor: Colors.white,
                      size: 6.0,
                      activeSize: 9.0),
                ),
                viewportFraction: 0.7,
                scale: 0.3,
                itemBuilder: (context, index) {
                  return GlassmorphicContainer(
                    width: 350,
                    height: 400,
                    borderRadius: 20,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.10),
                          const Color(0xFFFFFFFF).withOpacity(0.25)
                        ],
                        stops: const [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.0),
                          const Color(0xFFFFFFFF).withOpacity(0.0)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            devimages[index],
                            height: 300,
                            width: 230,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            names[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Oxanium',
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          description[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Oxanium',
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     IconButton(
                        //       onPressed: () async {
                        //         const url = '';
                        //         final uri = Uri.parse(url);
                        //         if (await canLaunchUrl(uri)) {
                        //           await launchUrl(uri);
                        //         } else {
                        //           throw 'Could not launch $url';
                        //         }
                        //       },
                        //       icon: const Icon(
                        //         MyFlutterApp.linkedin,
                        //         color: Colors.purple,
                        //         size: 45,
                        //       ),
                        //     ),
                        //     IconButton(
                        //       onPressed: () async {
                        //         const url = '';
                        //         final uri = Uri.parse(url);
                        //         if (await canLaunchUrl(uri)) {
                        //           await launchUrl(uri);
                        //         } else {
                        //           throw 'Could not launch $url';
                        //         }
                        //       },
                        //       icon: const Icon(
                        //         MyFlutterApp.github,
                        //         color: Colors.purple,
                        //         size: 45,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
