import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cart_page/login/components/common/custom_font_button.dart';
import 'package:cart_page/login/components/forget_password_page.dart';
import 'package:cart_page/login/components/signup_page.dart';
import 'package:cart_page/login/mygif.dart';
import 'package:cart_page/login/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  Future<void> _handleLoginUser() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oops',
        //  titleFamily: "berky",
          message: 'Enter all fields correctly',
          //messageFontSize: 20,
          //messageFamily: "berky",
          contentType: ContentType.failure,
        ),
      ));
    } else {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Submitting data',
         // titleFamily: "Walter",
          message: 'Please wait',
          //messageFontSize: 25,
          //messageFamily: "berky",
          contentType: ContentType.success,
        ),
      ));
    }
    database dt = database();
    bool res = await dt.login(
        username: _usernameController.text, password: _passwordController.text);
  }

  void _forgetpw() {
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
          builder: (context) => ForgetPasswordPage(),
        ),
      );
    });
  }

  void direct() {
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
          builder: (context) => const SignupPage(),
        ),
      );
    });
  }

  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/3.png',
                color: Color.fromRGBO(255, 255, 255, 0.88),
                colorBlendMode: BlendMode.modulate,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1),
                        child: Text(
                          'WELCOME',
                          style: TextStyle(
                            fontFamily: 'ulove',
                            fontSize: size.width * 0.1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.06),
                        child: GlassmorphicContainer(
                          blur: 2,
                          border: size.width * 0.009,
                          borderGradient: LinearGradient(colors: [
                            Colors.blue.withOpacity(0.3),
                            Colors.blue.withOpacity(0.3),
                          ]),
                          borderRadius: size.width * 0.3,
                          height: size.height * 0.08,
                          linearGradient: LinearGradient(colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.white.withOpacity(0.3),
                          ]),
                          width: size.width * 0.8,
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                              color: Colors.black,
                            ),
                            controller: _usernameController,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.02,
                                  top: size.height * 0.033,
                                  bottom: size.height * 0.017,
                                ),
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                fontFamily: 'berky',
                                fontSize: size.width * 0.053,
                              ),
                              contentPadding: EdgeInsets.only(
                                bottom: size.height * 0.001,
                                top: size.height * 0.02,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return;
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.06),
                        child: GlassmorphicContainer(
                          blur: 2,
                          border: size.width * 0.009,
                          borderGradient: LinearGradient(colors: [
                            Colors.blue.withOpacity(0.3),
                            Colors.blue.withOpacity(0.3),
                          ]),
                          borderRadius: size.width * 0.3,
                          height: size.height * 0.08,
                          linearGradient: LinearGradient(colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.3),
                          ]),
                          width: size.width * 0.8,
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                              color: Colors.black,
                            ),
                            obscureText: _obscureText,
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.02,
                                  top: size.height * 0.033,
                                  bottom: size.height * 0.017,
                                ),
                                child: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontFamily: 'berky',
                                fontSize: size.width * 0.06,
                              ),
                              contentPadding: EdgeInsets.only(
                                bottom: size.height * 0.001,
                                top: size.height * 0.02,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              suffixIcon: Container(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.012),
                                child: IconButton(
                                  iconSize: size.width * 0.053,
                                  icon: _obscureText
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  color: Colors.white,
                                  onPressed: toggle,
                                ),
                              ),
                            ),
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.009),
                      Container(
                        width: size.width * 0.8,
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => _forgetpw(),
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.045,
                              fontFamily: 'berky',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                      CustomFormButton(
                        innerText: 'Login',
                        onPressed: _handleLoginUser,
                      ),
                      SizedBox(height: size.height * 0.022),
                      SizedBox(
                        width: size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ? ',
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                color: Colors.white,
                                fontFamily: 'berky',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => direct(),
                              child: Text(
                                'SIGN-UP',
                                style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: Colors.white,
                                  fontFamily: 'berky',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
