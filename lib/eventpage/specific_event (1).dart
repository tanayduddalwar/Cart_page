import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cart_page/models/event_model.dart';
import 'package:cart_page/widgets/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:credenz/widgets/circularfab.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart'; // Assuming you have an Event model
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:get/get.dart';

import 'swipeable_content.dart';

class SpecificPage extends StatefulWidget {
  final Event event;

  const SpecificPage({Key? key, required this.event}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SpecificPageState();
  }
}

class _SpecificPageState extends State<SpecificPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _extensionAnimation;
  late Animation<double> _widthAnimation;
  bool _isExtended = false;
  int _tapCount = 0;
  @override
  void initState() {
    super.initState();
    _extensionAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _extensionAnimation.dispose();
    super.dispose();
  }

  void _handleTap() {
    _tapCount++;

    if (_tapCount == 3) {
      print('Image tapped 3 times');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        borderSide: const BorderSide(
          color: Colors.green,
          width: 2,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        buttonsBorderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        desc: widget.event.description,
        showCloseIcon: true,
      ).show();
      _tapCount = 0;
    } else {
      Timer(Duration(seconds: 1), () {
        _tapCount = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPassAdded = false;
    final Event event = widget.event;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        backgroundColor: Colors.transparent,
        elevation: 10,
        //   title: Padding(
        //     padding:
        //         EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
        //     child: Container(
        //       //height: MediaQuery.of(context).size.height*0.5,
        //       width: MediaQuery.of(context).size.width * 0.6,
        //       child: TextLiquidFill(
        //         text: "Reverse Coding",
        //         waveColor: Colors.blueAccent,
        //         //boxBackgroundColor: Colors.transparent,
        //         boxBackgroundColor: const Color(0x0060B7),
        //
        //         boxHeight: 100.0,
        //         boxWidth: MediaQuery.of(context).size.width * 6,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/3.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                top: kToolbarHeight + 20,
                // Adjust top position to fit under the app bar
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _handleTap();
                          },
                          child: Hero(
                            tag: event.imageUrl,
                            child: Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(event.imageUrl),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Hero(
                          tag: 'event-name-${event.name}',
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              event.name,
                              style: const TextStyle(
                                fontFamily: 'Bunaken',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SwipeableContent(
                      event: event,
                    ),
                    // Adjust vertical spacing
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FabCircularMenuPlus(
        ringColor: Colors.transparent,
        fabColor: Colors.white,
        ringDiameter: 250,
        ringWidth: 70,
        children: [
          FloatingActionButton(
            onPressed: () {
              final snackbar = SnackBar(
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: isPassAdded
                      ? "Pass already added to cart"
                      : "Added to cart",
                  message: isPassAdded
                      ? "The Pass has already been added to cart"
                      : "The Pass has been added to cart",
                  contentType:
                      isPassAdded ? ContentType.failure : ContentType.success,
                ),
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackbar);
              setState(() {
                isPassAdded = true;
              });
            },
            child: const Icon(
              Icons.card_giftcard_rounded,
            ),
          ),
          // Unique tag for the second FloatingActionButton
          FloatingActionButton(
            onPressed: () {
              Get.to(() => EventProducts());
            },
            child: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      // floatingActionButtonLocation: ExpandableFab.location,
    );
  }
}
