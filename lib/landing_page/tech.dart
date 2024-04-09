import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/eventpage/GlassMorphicContainer.dart';
import 'package:cart_page/eventpage/specific_event%20(1).dart';
import 'package:cart_page/landing_page/home.dart';
import 'package:cart_page/models/event_model.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
=======
>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TechEventsPage extends StatefulWidget {
  @override
  _TechEventsPageState createState() => _TechEventsPageState();
}

<<<<<<< HEAD
class _TechEventsPageState extends State<TechEventsPage>
    with SingleTickerProviderStateMixin {
=======
class _TechEventsPageState extends State<TechEventsPage> with SingleTickerProviderStateMixin {
>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df
  final PageController _pageController = PageController();
  final CartController cartController = Get.put(CartController());
  Color _containerColor = Color(0xff040829);
  List<Widget> eventPages = [];
<<<<<<< HEAD
  late ScrollController _scrollController;
  late AnimationController _controller;
  late Animation<double> _animation;
=======
  late final AnimationController _controller;
  late final Animation<double> _animation;
>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: -10,
      end: 10,
=======
    _controller = AnimationController(
     vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: -10, // Change the initial position to the top
      end: 10, // Change the final position to the bottom
>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df
    ).animate(_controller);
  }

  @override
  void dispose() {
    _pageController.dispose();
<<<<<<< HEAD
    _scrollController.dispose();
=======
>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df
    _controller.dispose();
    super.dispose();
  }

  void _buildEventPages(BuildContext context) {
    eventPages.clear();
    List<Event> displayedEvents = [];
    for (int i = 0; i < Event.events.length; i++) {
      Event currentEvent = Event.events[i];
      if (currentEvent.isTechnical && !displayedEvents.contains(currentEvent)) {
        displayedEvents.add(currentEvent);
        if (eventPages.length % 2 == 0) {
          eventPages.add(
            CombinedEventCard(event: currentEvent),
          );
<<<<<<< HEAD
=======

>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df
          if ((i) == 2) {
            eventPages.add(
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (i == 5) {
<<<<<<< HEAD
            eventPages.add(
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
=======
            eventPages.add(SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ));
          } else {
            eventPages.add(
              revCombinedEventCard(event: currentEvent),
>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildEventPages(context);
    return Scaffold(
      backgroundColor: _containerColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.off(() => HomePage());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.12,
            ),
            child: Text(
              'Credenz\'24',
              style: GoogleFonts.berkshireSwash(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/77.gif",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  color: _containerColor,
                  width: MediaQuery.of(context).size.height * 1,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    top: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Center(
                    child: Text(
                      "Tech Events",
                      style: TextStyle(
                        fontFamily: "berky",
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    //  controller: _scrollController,
                    itemCount: eventPages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return eventPages[index];
                    },
                  ),
                ),
              ],
            ),
          ),
<<<<<<< HEAD
=======
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: ArrowAnimation(animation: _animation),
            ),
          ),
>>>>>>> a12bb276c6b5687c67b9925d07f8c4b573deb8df
        ],
      ),
    );
  }
}

class ArrowAnimation extends StatefulWidget {
  final Animation<double> animation;

  const ArrowAnimation({
    Key? key,
    required this.animation,
  }) : super(key: key);

  @override
  _ArrowAnimationState createState() => _ArrowAnimationState();
}

class _ArrowAnimationState extends State<ArrowAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, widget.animation.value),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_downward,
              color: Colors.white,
              size: 40,
            ),
          ),
        );
      },
    );
  }
}

class CombinedEventCard extends StatelessWidget {
  final Event event;
  const CombinedEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificPage(event: event),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/new.gif"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  height: MediaQuery.of(context).size.width * 0.27,
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: Center(
                    child: Hero(
                      tag: 'event-name-${event.name}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          event.name,
                          style: TextStyle(
                            fontFamily: "berky",
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Hero(
                    tag: event.imageUrl,
                    child: EventCard(
                      color1: Color.fromRGBO(4, 90, 171, 0.7),
                      color2: Color.fromRGBO(1, 37, 84, 0.7),
                      width: MediaQuery.of(context).size.width * 0.4,
                      eventimgsrc: event.imageUrl,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final double width;
  final Color color1;
  final Color color2;
  final String eventimgsrc;

  const EventCard({
    required this.width,
    required this.color1,
    required this.color2,
    required this.eventimgsrc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
              eventimgsrc,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class revCombinedEventCard extends StatelessWidget {
  final Event event;

  const revCombinedEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpecificPage(event: event),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/new.gif"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Hero(
                    tag: event.imageUrl,
                    child: EventCard(
                      color1: Color.fromRGBO(4, 90, 171, 0.7),
                      color2: Color.fromRGBO(1, 37, 84, 0.7),
                      width: MediaQuery.of(context).size.width * 0.4,
                      eventimgsrc: event.imageUrl,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  height: 120,
                  width: 120,
                  child: Center(
                    child: Hero(
                      tag: 'event-name-${event.name}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          event.name,
                          style: TextStyle(
                            fontFamily: "berky",
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeableContent extends StatefulWidget {
  final Event event;

  const SwipeableContent({Key? key, required this.event}) : super(key: key);

  @override
  State<SwipeableContent> createState() {
    return _SwipeableContentState();
  }
}

class _SwipeableContentState extends State<SwipeableContent> {
  late final CartController controller;
  int currentIndex = 0;
  void initState() {
    super.initState();
    controller = Get.put(CartController());
  }

  List<IconData> desIcon = [
    Icons.description_outlined,
    Icons.rule_sharp,
    Icons.schedule,
    Icons.call,
  ];

  @override
  Widget build(BuildContext context) {
    Event event = widget.event;
    List<dynamic> content = [
      event.description,
      event.rules,
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
              if (details.velocity.pixelsPerSecond.dx < 0) {
                setState(() {
                  currentIndex = (currentIndex + 1) % 4;
                });
              } else if (details.velocity.pixelsPerSecond.dx > 0) {
                setState(() {
                  currentIndex = (currentIndex - 1) % 4;
                  if (currentIndex < 0) currentIndex = 3;
                });
              }
            },
            child: Center(
              child: GlassmorphicContainer1(
                borderRadius:
                    MediaQuery.of(context).size.height * 0.02,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height *
                              0.01),
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
                                    0.03,
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
                                0.1,
                            height: MediaQuery.of(context).size.height *
                                0.06,
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
