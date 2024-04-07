import 'package:flutter/material.dart';


class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});
  final List<String> items = [
    'TERMS OF SERVICE',
    'The terms "We" / "Us" / "Our"/”Company” individually and collectively refer to PICT IEEE Student Branch and the terms "You" /"Your" / "Yourself" refer to the users.This Privacy Policy is an electronic record in the form of an electronic contract formed under the Information Technology Act, 2000 and the rules made thereunder and the amended provisions pertaining to electronic documents / records in various statutes as amended by the Information Technology Act, 2000. This Privacy Policy does not require any physical, electronic or digital signature.This Privacy Policy is a legally binding document between you and PICT IEEE Student Branch (both terms defined below). The terms of this Privacy Policy will be effective upon your acceptance of the same (directly or indirectly in electronic form, by clicking on the I accept tab or by use of the app or by other means) and will govern the relationship between you and PICT IEEE Student Branch for your use of the app.This document is published and shall be construed in accordance with the provisions of the Information Technology (reasonable security practices and procedures and sensitive personal data of information) rules, 2011 under Information Technology Act, 2000; that require publishing of the Privacy Policy for collection, use, storage and transfer of sensitive personal data or information.Please read this Privacy Policy carefully by using the app, you indicate that you understand, agree and consent to this Privacy Policy. If you do not agree with the terms of this Privacy Policy, please do not use this app.By providing us your information or by making use of the facilities provided by the app, you hereby consent to the collection, storage, processing and transfer of any or all of Your Personal Information and Non-Personal Information by us as specified under this Privacy Policy. You further agree that such collection, use, storage and transfer of your information shall not cause any loss or wrongful gain to you or any other person.',
    'USER INFORMATION',
    'To avail certain services on our apps, users are required to provide certain informationfor the registration process namely: - a) your name, b) email address, c) sex, d) age, e)PIN code, f) credit card or debit card details g) medical records and history h) sexualorientation, i) biometric information, j) password etc., and / or your occupation,interests, and the like. The Information as supplied by the users enables us to improveour sites and provide you the most user-friendly experience.All required information is service dependent and we may use the above said user information to, maintain, protect, and improve its services (including advertising services) and for developing new servicesSuch information will not be considered as sensitive if it is freely available andaccessible in the public domain or is furnished under the Right to Information Act, 2005 or any other law for the time being in force.',
    'LINKS TO THE OTHER SITES',
    'Our policy discloses the privacy practices for our own web site only. Our app provides links to other sites also that are beyond our control. We shall in no way be responsible in way for your use of such sites.',
    'INFORMATION SHARING',
    'We shares the sensitive personal information to any third party without obtaining the prior consent of the user in the following limited circumstances:(a)When it is requested or required by law or by any court or governmental agency or authority to disclose, for the purpose of verification of identity, or for the prevention, detection, investigation including cyber incidents, or for prosecution and punishment of offences. These disclosures are made in good faith and belief that such disclosure is reasonably necessary for enforcing these Terms; for complying with the applicable laws and regulations. (b)We proposes to share such information within its group companies and officers and employees of such group companies for the purpose of processing personal information on its behalf. We also ensure that these recipients of such information agree to process such information based on our instructions and in compliance with this Privacy Policy and any other appropriate confidentiality and security measures.',
    'INFORMATION SECURITY',
    'We take appropriate security measures to protect against unauthorized access to or unauthorized alteration, disclosure or destruction of data. These include internal reviews of our data collection, storage and processing practices and security measures, including appropriate encryption and physical security measures to guard against unauthorized access to systems where we store personal data.All information gathered on our app is securely stored within our controlled database. The database is stored on servers secured behind a firewall; access to the servers is password-protected and is strictly limited. However, as effective as our security measures are, no security system is impenetrable. We cannot guarantee the security of our database, nor can we guarantee that information you supply will not be intercepted while being transmitted to us over the Internet. And, of course, any information you include in a posting to the discussion areas is available to anyone with Internet access. However the internet is an ever evolving medium. We may change our Privacy Policy from time to time to incorporate necessary future changes. Of course, our use of any information we gather will always be consistent with the policy under which the information was collected, regardless of what the new policy may be.'
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final fSize = w > 600 ? 28.0 : 20.0;
    TextStyle format = TextStyle(
      color: Colors.white,
      fontFamily: 'OxaniumLight',
      fontSize: fSize - 4.0,
      fontWeight: FontWeight.w300,
    );
    TextStyle format2 = TextStyle(
      color: Colors.white,
      fontFamily: 'OxaniumLight',
      fontSize: fSize - 4.0,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title:Text(
           'PRIVACY POLICY',
          style: TextStyle(
            fontFamily: 'berky',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fSize - 5.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 0.04 * h,
              ),
              Image(
                height: 0.3 * h,
                image: const AssetImage("assets/Lock.jpg"),
              ),
              SizedBox(
                height: 0.1 * h,
              ),
              SizedBox(
                height: 0.08 * h,
                width: 0.8 * w,
                child: Text(
                  'We never use or share your personal information without your permission.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'OxaniumRegular',
                    fontSize: fSize - 3.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 0.05 * h,
              ),
              SizedBox(
                height: 0.09 * h,
                width: 0.8 * w,
                child: Text(
                  'We always abide by the following terms and conditions for all the information that you provide.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'OxaniumRegular',
                    fontSize: fSize - 3.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 0.09 * h,
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    enableDrag: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: Colors.blue[300],
                    barrierColor: Colors.transparent.withOpacity(0.5),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: h,
                        margin: const EdgeInsets.all(12.0),
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              height: 0.015 * h,
                            ),
                            Center(
                              child: Text(
                                '${items[0]}\n',
                                textAlign: TextAlign.justify,
                                style: format2,
                              ),
                            ),
                            Text(
                              '${items[1]}\n',
                              textAlign: TextAlign.justify,
                              style: format,
                            ),
                            Center(
                              child: Text(
                                '${items[2]}\n',
                                textAlign: TextAlign.justify,
                                style: format2,
                              ),
                            ),
                            Text(
                              '${items[3]}\n',
                              textAlign: TextAlign.justify,
                              style: format,
                            ),
                            Center(
                              child: Text(
                                '${items[4]}\n',
                                textAlign: TextAlign.justify,
                                style: format2,
                              ),
                            ),
                            Text(
                              '${items[5]}\n',
                              textAlign: TextAlign.justify,
                              style: format,
                            ),
                            Center(
                              child: Text(
                                '${items[6]}\n',
                                textAlign: TextAlign.justify,
                                style: format2,
                              ),
                            ),
                            Text(
                              '${items[7]}\n',
                              textAlign: TextAlign.justify,
                              style: format,
                            ),
                            Center(
                              child: Text(
                                '${items[8]}\n',
                                textAlign: TextAlign.justify,
                                style: format2,
                              ),
                            ),
                            Text(
                              '${items[9]}\n',
                              textAlign: TextAlign.justify,
                              style: format,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 0.04 * h,
                  width: 0.8 * w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 2, 84, 165),
                  ),
                  child: Center(
                    child: Text(
                      'OPEN TERMS AND CONDITONS',
                      style: TextStyle(
                        fontSize: fSize - 4.0,
                        fontFamily: 'berky',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
