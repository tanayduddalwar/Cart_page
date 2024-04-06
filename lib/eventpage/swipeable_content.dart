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
  late PageController _pageController;
  int currentIndex = 0;

  List<IconData> desIcon = [
    Icons.description_outlined,
    Icons.rule_sharp,
    Icons.schedule,
    Icons.call,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    setState(() {
      currentIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Event event = widget.event;
    Map<String, String> rules = event.rules;
    Map<String, String> structure = event.structure;
    List<dynamic> contactList = event.contact;

    // Format rules map
    String formattedRules = rules.entries
        .map((entry) => "${entry.key}: ${entry.value}\n ")
        .join('\n');

    // Format structure map
    String formattedStructure = structure.entries
        .map((entry) => "${entry.key}: ${entry.value}\n")
        .join('\n');

    // Format contact list
    String formattedContacts = contactList
        .map((contact) => "${contact['name']}: ${contact['phone']}\n")
        .join('\n');

    List<dynamic> content = [
      event.body,
      // Displaying rules
      formattedRules,
      formattedStructure,
      // Displaying contact numbers
      formattedContacts
    ];
    print(content);
    // Now you can use this `content` list for displaying in your UI

    return Center(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height / 1.8,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              // Swiped left
              if (details.velocity.pixelsPerSecond.dx < 0) {
                setState(() {
                  currentIndex = (currentIndex + 1) % 4;
                  _pageController.animateToPage(currentIndex,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                });
              }
              // Swiped right
              else if (details.velocity.pixelsPerSecond.dx > 0) {
                setState(() {
                  currentIndex = (currentIndex - 1) % 4;
                  if (currentIndex < 0) currentIndex = 3;
                  _pageController.animateToPage(currentIndex,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                });
              }
            },
            child: Center(
              child: GlassmorphicContainer1(
                borderRadius: MediaQuery.of(context).size.height * 0.02,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          desIcon.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                                _pageController.animateToPage(currentIndex,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              });
                            },
                            child: Text(
                              String.fromCharCode(desIcon[index].codePoint),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MaterialIcons',
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
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
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: content.length,
                        itemBuilder: (context, index) {
                          print(content[index]);
                          print(content.length);
                          return SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.005,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Text(
                                content[index],
                                style: const TextStyle(
                                  fontFamily: "berky",
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          );
                        },
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
                          Text(
                            "Price : ${event.price}",
                            style: TextStyle(
                              fontFamily: 'berky',
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.1,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.8),
                            ),
                            child: IconButton(
                              onPressed: () {
                                controller.addProduct(context, event);
                               // Get.snackbar
                                final snackBar =
                                SnackBar(
                                  elevation: 5,
                                  behavior: SnackBarBehavior.fixed,
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'Ready To Go !',
                                    message: 'Event Added To Cart!',
                                    contentType: ContentType.success,
                                  ),
                                );

                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: const Icon(
                                Icons.add_shopping_cart_rounded,
                                color: Colors.amber,
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
