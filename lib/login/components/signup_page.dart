import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cart_page/landing_page/home.dart';
import 'package:cart_page/login/components/common/custom_font_button.dart';
import 'package:cart_page/login/components/login_page.dart';
import 'package:cart_page/login/services/networking.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _passwordsMatch = true;

  @override
  void initState() {
    super.initState();
    _confirmPasswordController.addListener(_checkPasswordMatch);
  }

  void _checkPasswordMatch() {
    setState(() {
      _passwordsMatch =
          _confirmPasswordController.text == _passwordController.text;
    });
  }

  @override
  void dispose() {
    _confirmPasswordController.removeListener(_checkPasswordMatch);
    super.dispose();
  }

  bool _isFirstNameValid = true;
  bool _isLastNameValid = true;
  bool _obscureText = true;
  bool _isPictian = false;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _collegeNameController = TextEditingController();

  final _signupFormKey = GlobalKey<FormState>();

  /*void _handleSignUp() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String firstname = _firstNameController.text.trim();
    String lastname = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String confirmpassword = _confirmPasswordController.text.trim();
    String college = _collegeNameController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        firstname.isEmpty ||
        lastname.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        college.isEmpty ||
        confirmpassword.isEmpty) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oops',
          titleFamily: "Walter",
          message: 'Enter all fields',
          messageFontSize: 25,
          messageFamily: "Walter",
          contentType: ContentType.failure,
        ),
      ));
      if (!EmailValidator.validate(email)) {
        Fluttertoast.showToast(
            msg: "Enter valide Email-id!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        if (password != confirmpassword) {
          Fluttertoast.showToast(
              msg: "The passwords do not match!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else if (password != confirmpassword) {
        Fluttertoast.showToast(
            msg: "The passwords do not match!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else if (!EmailValidator.validate(email)) {
      Fluttertoast.showToast(
          msg: "Enter valide Email-id",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      if (password != confirmpassword) {
        Fluttertoast.showToast(
            msg: "The passwords do not match!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else if (password != confirmpassword) {
      Fluttertoast.showToast(
          msg: "The passwords do not match!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Submitting data',
          titleFamily: "Walter",
          message: 'Please wait',
          messageFontSize: 25,
          messageFamily: "Walter",
          contentType: ContentType.success,
        ),
      ));
    }
  }*/
  void _handleSignUp() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String firstname = _firstNameController.text.trim();
    String lastname = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String confirmpassword = _confirmPasswordController.text.trim();
    String college = _collegeNameController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        firstname.isEmpty ||
        lastname.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        college.isEmpty ||
        confirmpassword.isEmpty ||
        !EmailValidator.validate(email) ||
        !_isFirstNameValid ||
        !_isLastNameValid ||
        !_passwordsMatch) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oops',
          //titleFamily: "Walter",
          message: 'Enter all fields correctly',
          //messageFontSize: 20,
          //messageFamily: "Walter",
          contentType: ContentType.failure,
        ),
      ));

      //   if (!EmailValidator.validate(email)) {
      //     Fluttertoast.showToast(
      //         msg: "Enter valide Email-id!",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 1,
      //         backgroundColor: Colors.red,
      //         textColor: Colors.white,
      //         fontSize: 16.0);
      //     if (password != confirmpassword) {
      //       Fluttertoast.showToast(
      //           msg: "The passwords do not match!",
      //           toastLength: Toast.LENGTH_SHORT,
      //           gravity: ToastGravity.CENTER,
      //           timeInSecForIosWeb: 1,
      //           backgroundColor: Colors.red,
      //           textColor: Colors.white,
      //           fontSize: 16.0);
      //     }
      //   } else if (password != confirmpassword) {
      //     Fluttertoast.showToast(
      //         msg: "The passwords do not match!",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 1,
      //         backgroundColor: Colors.red,
      //         textColor: Colors.white,
      //         fontSize: 16.0);
      //   }
      // } else if (!EmailValidator.validate(email)) {
      //   Fluttertoast.showToast(
      //       msg: "Enter valide Email-id",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      //   if (password != confirmpassword) {
      //     Fluttertoast.showToast(
      //         msg: "The passwords do not match!",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 1,
      //         backgroundColor: Colors.red,
      //         textColor: Colors.white,
      //         fontSize: 16.0);
      //   }
      // } else if (password != confirmpassword) {
      //   Fluttertoast.showToast(
      //       msg: "The passwords do not match!",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // } else {
      //   FocusScope.of(context).unfocus();
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     elevation: 0,
      //     behavior: SnackBarBehavior.floating,
      //     backgroundColor: Colors.transparent,
      //     content: AwesomeSnackbarContent(
      //       title: 'Submitting data',
      //       titleFamily: "Walter",
      //       message: 'Please wait',
      //       messageFontSize: 25,
      //       messageFamily: "Walter",
      //       contentType: ContentType.success,
      //     ),
      //   ));
      return;
    }
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Submitting data',
        // titleFamily: "Walter",
        message: 'Please wait',
        // messageFontSize: 25,
        // messageFamily: "Walter",
        contentType: ContentType.success,
      ),
    ));
    database db = database();
    bool signedin = await db.register(
      username: _usernameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      firstname: _firstNameController.text.trim(),
      lastname: _lastNameController.text.trim(),
      password: _passwordController.text.trim(),
      college: _collegeNameController.text.trim(),
      confirmpassword: _confirmPasswordController.text.trim(),
    );
    print(signedin);
    if (signedin) {
      Get.offAll(() => HomePage());
    } else {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Check Credentails again',
          // titleFamily: "Walter",
          message: 'Password should be of minimum length 6',
          // messageFontSize: 25,
          // messageFamily: "Walter",
          contentType: ContentType.failure,
        ),
      ));
    }
  }

  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/credenz24.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.width * 0.09),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'berky',
                        fontSize: size.width * 0.12,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.06),
                  child: Column(
                    children: [
                      GlassmorphicContainer(
                        blur: 2,
                        border: size.width * 0.009,
                        borderGradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3)
                        ]),
                        borderRadius: size.height * 0.3,
                        height: size.height * 0.08,
                        linearGradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.3)
                        ]),
                        width: size.width * 0.80,
                        child: TextFormField(
                          onChanged: (value) {
                            bool containsDigits = value.contains(RegExp(r'\d'));
                            setState(() {
                              _isFirstNameValid = !containsDigits;
                            });
                          },
                          style: TextStyle(
                            fontFamily: 'berky',
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            icon: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.width * 0.04,
                                    bottom: size.width * 0.008),
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                )),
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                            ),
                            contentPadding: EdgeInsets.only(
                                bottom: size.width * 0.001,
                                top: size.width * 0.04),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          controller: _firstNameController,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return;
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                          child: _isFirstNameValid
                              ? SizedBox()
                              : Padding(
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.01),
                                  child: Text(
                                    'First name cannot contain digits',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )),
                      SizedBox(height: size.width * 0.045),
                      GlassmorphicContainer(
                        blur: 2,
                        border: size.width * 0.009,
                        borderGradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3)
                        ]),
                        borderRadius: size.height * 0.3,
                        height: size.height * 0.08,
                        linearGradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.3)
                        ]),
                        width: size.width * 0.80,
                        child: TextFormField(
                          onChanged: (value) {
                            bool containsDigits = value.contains(RegExp(r'\d'));
                            setState(() {
                              _isLastNameValid = !containsDigits;
                            });
                          },
                          style: TextStyle(
                            fontFamily: 'berky',
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            icon: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.width * 0.04,
                                    bottom: size.width * 0.008),
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                )),
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                            ),
                            contentPadding: EdgeInsets.only(
                                bottom: size.width * 0.001,
                                top: size.width * 0.04),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          controller: _lastNameController,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                            } else if (textValue.contains(RegExp(r'\d'))) {
                              return 'First name should not contain digits';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                          child: _isLastNameValid
                              ? SizedBox()
                              : Padding(
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.01),
                                  child: Text(
                                    'Last name cannot contain digits',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )),
                      SizedBox(height: size.width * 0.045),
                      GlassmorphicContainer(
                        blur: 2,
                        border: size.width * 0.009,
                        borderGradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3)
                        ]),
                        borderRadius: size.height * 0.3,
                        height: size.height * 0.08,
                        linearGradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.3)
                        ]),
                        width: size.width * 0.80,
                        child: TextFormField(
                          cursorColor: Colors.blue,
                          style: TextStyle(
                            fontFamily: 'berky',
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            icon: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.width * 0.04,
                                    bottom: size.width * 0.008),
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                )),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                            ),
                            contentPadding: EdgeInsets.only(
                                bottom: size.width * 0.001,
                                top: size.width * 0.04),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          controller: _usernameController,
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: size.width * 0.045),
                      GlassmorphicContainer(
                        blur: 2,
                        border: size.width * 0.009,
                        borderGradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3)
                        ]),
                        borderRadius: size.height * 0.3,
                        height: size.height * 0.08,
                        linearGradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.3)
                        ]),
                        width: size.width * 0.80,
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'berky',
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            icon: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.width * 0.04,
                                    bottom: size.width * 0.008),
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                )),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                            ),
                            contentPadding: EdgeInsets.only(
                                bottom: size.width * 0.001,
                                top: size.width * 0.04),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return null;
                            } else if (!EmailValidator.validate(email)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: size.width * 0.045),
                      GlassmorphicContainer(
                        blur: 2,
                        border: size.width * 0.009,
                        borderGradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3)
                        ]),
                        borderRadius: size.height * 0.3,
                        height: size.height * 0.08,
                        linearGradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.3)
                        ]),
                        width: size.width * 0.80,
                        child: TextFormField(
                          cursorColor: Colors.blue,
                          style: TextStyle(
                            fontFamily: 'berky',
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            icon: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.width * 0.04,
                                    bottom: size.width * 0.008),
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                )),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                            ),
                            contentPadding: EdgeInsets.only(
                                bottom: size.width * 0.001,
                                top: size.width * 0.04),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (phone) {
                            if (phone == null || phone.isEmpty) {
                              return;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: size.width * 0.045),
                      GlassmorphicContainer(
                        blur: 2,
                        border: size.width * 0.009,
                        borderGradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3)
                        ]),
                        borderRadius: size.height * 0.3,
                        height: size.height * 0.08,
                        linearGradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.3)
                        ]),
                        width: size.width * 0.80,
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'berky',
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                          obscureText: _obscureText,
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              color: Colors.white,
                              onPressed: toggle,
                            ),
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.width * 0.04,
                                    bottom: size.width * 0.008),
                                child: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                )),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                            ),
                            contentPadding: EdgeInsets.only(
                                bottom: size.width * 0.001,
                                top: size.width * 0.04),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
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
                      SizedBox(height: size.width * 0.045),
                      GlassmorphicContainer(
                        blur: 2,
                        border: size.width * 0.009,
                        borderGradient: LinearGradient(colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3)
                        ]),
                        borderRadius: size.height * 0.3,
                        height: size.height * 0.08,
                        linearGradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.3)
                        ]),
                        width: size.width * 0.80,
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'berky',
                            fontSize: size.width * 0.05,
                            color: Colors.black,
                          ),
                          obscureText: _obscureText,
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              color: Colors.white,
                              onPressed: toggle,
                            ),
                            prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    top: size.width * 0.04,
                                    bottom: size.width * 0.008),
                                child: Icon(
                                  Icons.password,
                                  color: Colors.white,
                                )),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontFamily: "berky",
                              fontSize: size.width * 0.06,
                            ),
                            contentPadding: EdgeInsets.only(
                                bottom: size.width * 0.001,
                                top: size.width * 0.04),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          validator: (textValue) {
                            if (textValue == null || textValue.isEmpty) {
                              return null;
                            } else if (textValue != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: size.width * 0.045),
                      if (!_passwordsMatch)
                        Text(
                          'Passwords do not match',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: size.width * 0.036,
                          ),
                        ),
                      SizedBox(height: size.width * 0.045),
                      Row(
                        children: [
                          Checkbox(
                            value: _isPictian,
                            onChanged: (value) {
                              setState(() {
                                _isPictian = value!;
                                _collegeNameController.text =
                                    _isPictian ? "PICT" : "";
                              });
                            },
                          ),
                          Text(
                            'Are you a Pictian?',
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "berky",
                            ),
                          ),
                        ],
                      ),
                      if (!_isPictian)
                        GlassmorphicContainer(
                          blur: 2,
                          border: size.width * 0.009,
                          borderGradient: LinearGradient(colors: [
                            Colors.blue.withOpacity(0.3),
                            Colors.blue.withOpacity(0.3)
                          ]),
                          borderRadius: size.height * 0.3,
                          height: size.height * 0.08,
                          linearGradient: LinearGradient(colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.3)
                          ]),
                          width: size.width * 0.80,
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.06,
                              color: Colors.white,
                            ),
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              icon: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      top: size.width * 0.04,
                                      bottom: size.width * 0.008),
                                  child: Icon(
                                    Icons.apartment,
                                    color: Colors.white,
                                  )),
                              hintText: 'College Name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'berky',
                                fontSize: size.width * 0.05,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.only(
                                  bottom: size.width * 0.001,
                                  top: size.width * 0.04),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            controller: _collegeNameController,
                            validator: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return;
                              }
                              return null;
                            },
                          ),
                        ),
                      SizedBox(height: size.width * 0.045),
                      CustomFormButton(
                        innerText: 'Sign Up',
                        onPressed: _handleSignUp,
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontFamily: 'berky',
                              fontSize: size.width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => LoginPage());
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontFamily: 'berky',
                                fontSize: size.width * 0.04,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.width * 0.045),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
