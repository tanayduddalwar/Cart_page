import 'package:flutter/cupertino.dart';

class MenuScreen extends StatelessWidget{
  const MenuScreen({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context){
    return Container(
      color: Color(0000),
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget> [
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}