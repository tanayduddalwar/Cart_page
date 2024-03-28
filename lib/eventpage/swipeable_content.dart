import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/models/event_model.dart';
import 'package:cart_page/widgets/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GlassMorphicContainer.dart';

class SwipeableContent extends StatefulWidget {
  final Event event;

  const SwipeableContent({Key? key, required this.event}) : super(key: key);

  @override
  State<SwipeableContent> createState() {
    return _SwipeableContentState();
  }
}

class _SwipeableContentState extends State<SwipeableContent> {
  final CartController controller = Get.find();
  int currentIndex = 0;

  List<IconData> desIcon = [
    Icons.description_outlined,
    Icons.rule_sharp,
    Icons.schedule,
    Icons.call,
  ];

  @override
  Widget build(BuildContext context) {
    Event event = widget.event;
    List<String> content = [
      event.description,
      event.rules,
      event.schedule,
      event.contact,
    ];

    return Center(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              // Swiped left
              if (details.velocity.pixelsPerSecond.dx < 0) {
                setState(() {
                  currentIndex =
                      (currentIndex + 1) % 4; // Assuming there are 4 sections
                });
              }
              // Swiped right
              else if (details.velocity.pixelsPerSecond.dx > 0) {
                setState(() {
                  currentIndex = (currentIndex - 1) % 4;
                  if (currentIndex < 0) currentIndex = 3;
                });
              }
            },
            child: Center(
              child: GlassmorphicContainer(
                borderRadius: MediaQuery.of(context).size.height *
                    0.02, // 2% of screen height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height *
                              0.01), // 1% of screen height
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          desIcon.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Text(
                              String.fromCharCode(desIcon[index].codePoint),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MaterialIcons',
                                fontSize: MediaQuery.of(context).size.height *
                                    0.03, // 3% of screen height
                                decoration: currentIndex == index
                                    ? TextDecoration.underline
                                    : null,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                      indent: 0,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.005,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          // 0.5% of screen height and 5% of screen width
                          child: Text(
                            content[currentIndex],
                            style: const TextStyle(
                              fontFamily: "Bunaken",
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Price\tRs.50/-",
                            style: TextStyle(
                              fontFamily: 'Bunaken',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.height *
                                0.1, // 10% of screen height
                            height: MediaQuery.of(context).size.height *
                                0.06, // 10% of screen height
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.8),
                            ),
                            child: IconButton(
                              onPressed: () {
                                controller.addProduct(context, event);
                              },
                              icon: const Icon(
                                Icons.add_shopping_cart_rounded,
                                color: Colors.black,
                                size: 19,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
