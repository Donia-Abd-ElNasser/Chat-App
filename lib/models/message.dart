import 'package:chatapp3/helper/ShowSnackBar.dart';

class Message {
  final String message;
final String id ;
  Message(  this.message,this.id);
  factory Message.fromjson (jsonData){
    return Message( jsonData[kmessages],jsonData['id']);
  }

}