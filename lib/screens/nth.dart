import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popup_banner/popup_banner.dart';

void main() {
  runApp(const Nth());
}

class Nth extends StatelessWidget {
  const Nth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<String> imagesWithText = [
  "assets/card_sea.png,Title 1,Subtitle 1",
  "https://tinyurl.com/popup-banner-image2,Title 2,Subtitle 2",
  "https://tinyurl.com/popup-banner-image3,Title 3,Subtitle 3",
  "https://tinyurl.com/popup-banner-image4,Title 4,Subtitle 4"
];

  void showDefaultPopup() {
    PopupBanner(
      context: context,
      images: imagesWithText,
      onClick: (index) {
        debugPrint("CLICKED $index");
      },
    ).show();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buttonWidget(
              title: "Hints!!!!",
              onClick: () => showDefaultPopup(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget({
    required String title,
    required VoidCallback onClick,
  }) {
    return ElevatedButton(
      onPressed: () => onClick(),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
