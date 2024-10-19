import 'package:flutter/material.dart';

class SigningButton extends StatelessWidget {
    SigningButton({this.onTap , required this.ButtonText});
 final String ButtonText;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
            decoration: BoxDecoration( color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
            width: 350,height: 50,
          
           child: Center(child: Text( ButtonText,style: const TextStyle(fontSize: 20),))
           ),
    );
  }
}