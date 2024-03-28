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

  @override
  void initState() {
    super.initState();
    _extensionAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _widthAnimation = Tween<double>(begin: 60.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _extensionAnimation,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _extensionAnimation.dispose();
    super.dispose();
  }

  void _toggleExtension() {
    setState(() {
      _isExtended = !_isExtended;
      if (_isExtended) {
        _extensionAnimation.forward();
      } else {
        _extensionAnimation.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
          child: Container(
            //height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextLiquidFill(
              text: "Reverse Coding",
              waveColor: Colors.blueAccent,
              //boxBackgroundColor: Colors.transparent,
              boxBackgroundColor: const Color(0x0060B7),

              boxHeight: 100.0,
              boxWidth: MediaQuery.of(context).size.width * 6,
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/newbg.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                top: kToolbarHeight + 20,
                // Adjust top position to fit under the app bar
                child: Column(
                  children: [
                    Hero(
                      tag: 'event-img-${event.imageUrl}',
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
        ringDiameter: 250,
        ringWidth: 70,
        children: [
          FloatingActionButton(
            onPressed: () {
              final snackbar = SnackBar(
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: "Added to cart",
                  message: "The Pass has been added to cart",
                  contentType: ContentType.success,
                ),
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackbar);
            },
            child: const Icon(
              Icons.card_giftcard_rounded,
            ),
          ),
          // Unique tag for the second FloatingActionButton
          FloatingActionButton(
            onPressed: () {
              Get.to(EventProducts());
            },
            child: const Icon(Icons.shopping_cart),
          ),
        ],
      ),

      // floatingActionButtonAnimator: NoScalingAnimation(),
    );
    //  elevation: 0,
  }
}
