import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:lottie/lottie.dart';

class EmptyCart extends StatelessWidget {
  final CartController controller = Get.find();
  EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/common.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'CART',
                style: TextStyle(
                  fontFamily: "Ulove",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Obx(
                    () => Row(
                      children: [
                        badges.Badge(
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/empty_cart.json'),
                SizedBox(height: 20),
                Text(
                  "No item in the cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
