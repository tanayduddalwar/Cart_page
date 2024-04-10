import 'package:cart_page/login/components/common/custom_font_button.dart';
import 'package:cart_page/login/components/email.dart';
import 'package:cart_page/login/components/login_page.dart';
import 'package:cart_page/login/mygif.dart';
import 'package:cart_page/login/services/networking.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _forgetPasswordFormKey = GlobalKey<FormState>();
  late String email;

  void btl() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.77),
      builder: (BuildContext context) {
        return Center(child: mygif());
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/credenz24.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Container(
                width: size.width,
                height: size.height,
                child: Container(
                  child: Form(
                    key: _forgetPasswordFormKey,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.2,
                        ),
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontFamily: 'Walter',
                              fontSize: 40,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: GlassmorphicContainer(
                            blur: 2,
                            border: 2,
                            borderGradient: LinearGradient(colors: [
                              Colors.blue.withOpacity(0.3),
                              Colors.blue.withOpacity(0.3)
                            ]),
                            borderRadius: 30,
                            height: 55,
                            linearGradient: LinearGradient(colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.3)
                            ]),
                            width: size.width * 0.80,
                            child: TextFormField(
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  icon: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      )),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Walter', fontSize: 30),
                                  contentPadding: EdgeInsets.only(bottom: 0.01),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                validator: (textValue) {
                                  if (textValue == null || textValue.isEmpty) {
                                    return 'Email is required!';
                                  }
                                  if (!EmailValidator.validate(textValue)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  email = value;
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomFormButton(
                          innerText: 'Submit',
                          onPressed: () async {
                            database db = database();
                            bool val = await db.forgotPassword(
                                context: context, email: email);
                            if (val) {
                              Get.to(() => EmailScreen());
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => btl(),
                            child: const Text(
                              'Back to login',
                              style: TextStyle(
                                fontFamily: 'Walter',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleForgetPassword() {
    // forget password
    if (_forgetPasswordFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );
    }
  }
}
