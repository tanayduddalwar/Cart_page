import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 75),
        height: 52,
        color: Colors.white70, // Set the background color here
        child: Container(
          //margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(50), // Set the border radius here
          ),
          child: Container(
             decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(50), // Set the border radius here
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('\Rs:${controller.total}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
