import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/widgets/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class EmptyCart extends StatelessWidget {
  final CartController controller = Get.find();
  EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/common.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: AppBar(
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Container(
                          width: 270,
                          child: TextLiquidFill(
                            boxWidth: 220,
                            text: 'CART',
                            waveColor: Colors.blue,
                            boxBackgroundColor:
                                const Color.fromARGB(255, 48, 197, 230),
                            textStyle: TextStyle(
                              fontFamily: "Ulove",
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                            boxHeight: 300.0,
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Obx(
                              () => Row(
                                children: [
                                  badges.Badge(
                                    onTap: () => EventProducts(),
                                    badgeContent: Text(
                                      "${controller.events.length}",
                                      style: TextStyle(fontFamily: "Bunaken"),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.shopping_cart),
                                      onPressed: () => {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            
              ),
            
              ),
            
              ),
              Text("No item in the cart"),

    ],
    ),
    );
  }
}
