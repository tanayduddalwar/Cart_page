import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cart_page/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final CartController controller = Get.find();

  late double totalAmount;

  @override
  void initState() {
    super.initState();
    totalAmount = double.parse(controller.total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Container(
          width: 200,
          child: TextLiquidFill(
            text: 'PAYMENT',
            waveColor: Colors.blueAccent,
            boxBackgroundColor: const Color.fromARGB(255, 48, 197, 230),
            textStyle: TextStyle(
              fontFamily: "Ulove",
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/common.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "ALMOST READY TO GO!!!",
                style: TextStyle(
                  fontFamily: "berky",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              Text(
                "Amount to be paid: ₹${controller.total}",
                style: TextStyle(
                  fontFamily: "berky",
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "UPI Payment QRCode",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
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
              Text(
                "Scan QR to Pay",
                style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed logic here
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
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
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                color: Colors.amber,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
      ),
    );
  }
}
