import 'package:chatapp3/helper/ShowSnackBar.dart';
import 'package:chatapp3/models/message.dart';
import 'package:flutter/material.dart';

class SenderBubbleWidget extends StatelessWidget {
   SenderBubbleWidget({
    super.key,required this.message
  });
Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
      //   height: 50,
      //  width: 100,
       padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(0)),
          color: Color.fromARGB(255, 157, 116, 101),
        ),
        child: Text(
                  message.message,
                  style: TextStyle(color: Colors.white),
                ),
      ),
    );
  }
}


class recieverBubbleWidget extends StatelessWidget {
   recieverBubbleWidget({
    super.key,required this.message
  });
Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
      //   height: 50,
      //  width: 100,
       padding: EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(35)),
          color: AppColor,
        ),
        child: Text(
                  message.message,
                  style: TextStyle(color: Colors.white),
                ),
      ),
    );
  }
}
