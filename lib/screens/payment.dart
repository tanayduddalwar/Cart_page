
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:cart_page/landing_page/home.dart';
import 'package:cart_page/login/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class Payment extends StatelessWidget {
  final CartController controller = Get.find();
  late double totalAmount;
  final TextEditingController _transactionIdController =
      TextEditingController();

  Payment() {
    totalAmount = double.parse(controller.total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Container(
          width: 200,
          child: Text(
            "PAYMENT",
            style: TextStyle(
              fontFamily: "berky",
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bgimg/1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Text(
                    "ALMOST READY TO GO!!!",
                    style: TextStyle(
                      fontFamily: "berky",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    "Amount to be paid: ₹${controller.total}",
                    style: TextStyle(
                      fontFamily: "berky",
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Scan QR to Pay",
                    style: TextStyle(
                        color: Colors.white38,
                        letterSpacing: 1.2,
                        fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  UPIPaymentQRCode(
                    upiDetails: UPIDetails(
                      upiID: "td2345@ibl",
                      payeeName: "Tanay",
                      amount: totalAmount,
                      transactionNote: "IEEE",
                    ),
                    size: 120,
                    upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic here
                          print('Button Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white, // Text color
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Colors.blueAccent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          'If Successful',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "berky",
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _transactionIdController,
                              cursorColor: Colors.red,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 10,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                ),
                                hintText: 'Enter the transaction ID',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "berky",
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                String transactionId =
                                    _transactionIdController.text;
                                if (transactionId.length != 12) {
                                  // Show error snackbar
                                  Get.snackbar(
                                    'Error',
                                    'Transaction ID should be 12 digits long',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                } else {
                                  // Proceed with submitting transaction ID
                                  print(
                                      'Submitted Transaction ID: $transactionId');
                                  print(controller.EventIndex);
                                  print(totalAmount);
                                  database db = database();
                                  db.placeOrders(
                                      eventList: controller.EventIndex,
                                      transactionId:
                                          double.parse(transactionId),
                                      amount: totalAmount.toInt());
                                  Get.snackbar(
                                    'Hurrah!!',
                                    'Order Placed Successfully',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );

                                  // controller.events.clear();
                                  // controller.techEvents.clear();
                                  // controller.nonTechEvents.clear();
                                  // controller.EventIndex.clear();
                                  //totalAmount = 0;
                                  //transactionId = "";
                                  // Get.offAll(() => HomePage());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 24,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: Colors.blueAccent,
                                    width: 3,
                                  ),
                                ),
                              ),
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "berky",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
