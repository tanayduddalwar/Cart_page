import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  const CustomFormButton(
      {Key? key, required this.innerText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 122, 211, 243),
            Color.fromARGB(255, 11, 153, 241)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: const Color(0xff233743),
        borderRadius: BorderRadius.circular(size.width * 0.2),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          innerText,
          style: const TextStyle(
              color: Colors.white, fontFamily: 'ulove', fontSize: 26),
        ),
      ),
    );
  }
}
