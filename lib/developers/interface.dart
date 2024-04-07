import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_flutter_app_icons.dart';

class ui extends StatelessWidget {
  final devimages = <String>[
    'assets/developers/ameya.jpeg',
    'assets/developers/tanay.jpeg',
    'assets/developers/yuvraj.jpeg',
    'assets/developers/shreyas.jpeg',
    'assets/developers/ketan.jpeg',
    'assets/developers/siddhi.jpeg',
    'assets/developers/shreya.jpeg',
    'assets/developers/ved.jpeg',
    'assets/developers/vedant.jpeg',
    'assets/developers/utkarsh.jpeg',
  ];

  static List<String> names = [
    'Ameya Surana',
    'Tanay Duddalwar',
    'Yuvraj Patil',
    'Shreyas Shirwadkar',
    'Ketan Bajaj',
    'Siddhi Bodake',
    'Shreya Pillai',
    'Ved Pingle',
    'Vedant Ghumre',
    'Utkharsh Brahmankar'
  ];

  static List<String> description = [
    'App Head',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
    'App Team',
  ];

  final List<String> urlLinkedin = [
    'https://www.linkedin.com/in/ameyasurana/',
    'https://www.linkedin.com/in/tanay-duddalwar-075a79286/',
    'https://www.linkedin.com/in/yuvraj-patil-04a2a5260/',
    'https://www.linkedin.com/in/shreyas-shirwadkar/',
    'https://www.linkedin.com/in/ketan-bajaj-653006299/',
    'https://www.linkedin.com/in/siddhi-bodake-3b494129a/',
    'https://www.linkedin.com/in/shreya-pillai-08b63a25a/',
    'https://www.linkedin.com/in/ved-pingle-233028258/',
  ];

  final List<String> urlGit = [
    'https://github.com/FireFeast7',
    'https://github.com/tanayduddalwar',
    'https://github.com/Yuvraj3006',
    'https://github.com/shreyasshirwadkar',
    'https://github.com/Ketanb08/',
    'https://github.com/sidbod23',
    'https://github.com/shreyapillai819',
    'https://github.com/vedpingle',
  ];

  ui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 150),
          SizedBox(
            height: 500,
            child: Swiper(
              scrollDirection: Axis.horizontal,
              autoplay: true,
              itemCount: 8,
              loop: true, // Enable loop
              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white24,
                  activeColor: Colors.white,
                  size: 6.0,
                  activeSize: 9.0,
                ),
              ),
              viewportFraction: 0.7,
              scale: 0.3,
              itemBuilder: (context, index) {
                final adjustedIndex = index % devimages.length; // Adjust index
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
                    stops: const [0.1, 1],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.0),
                      const Color(0xFFFFFFFF).withOpacity(0.0)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          devimages[adjustedIndex],
                          height: 300,
                          width: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          names[adjustedIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'berky',
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        description[adjustedIndex],
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'berky',
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final Uri uri =
                                  Uri.parse(urlLinkedin[adjustedIndex]);
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              } else {
                                throw 'Could not launch url';
                              }
                            },
                            child: SvgPicture.asset(
                              'assets/linkedin2.svg',
                              width: 35,
                              height: 35,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final Uri uri =
                                  Uri.parse(urlGit[adjustedIndex]);
                              if (await canLaunchUrl(uri)) {
                                print("Launched url");
                                await launchUrl(uri);
                              } else {
                                print("did not Launched url");
                                throw 'Could not launch url';
                              }
                            },
                            child: SvgPicture.asset(
                              'assets/github.svg',
                              width: 35,
                              height: 35,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
