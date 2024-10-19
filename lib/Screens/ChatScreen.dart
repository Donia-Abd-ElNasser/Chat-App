import 'package:chatapp3/helper/ShowSnackBar.dart';
import 'package:chatapp3/models/message.dart';
import 'package:chatapp3/widgets/SenderBubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'Chat Screen';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagesCollections);
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
   var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages!.orderBy(createdAt,descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data!.docs[0][kmessages]);
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; ++i) {
              messageList.add(Message.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/vecteezy_speech-bubble-talk-bubble-chat-bubble-icon-png-transparent_9664482.png',
                      height: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                automaticallyImplyLeading: false,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index].id == email ?  SenderBubbleWidget(
                          message: messageList[index], 
                        ):recieverBubbleWidget(message:messageList[index] );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kmessages: data,
                          createdAt: DateTime.now(),
                          'id':email,
                        });
                        controller.clear();
                        _controller.animateTo(
                           0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      decoration: InputDecoration(
                          hintText: 'Write a message here',
                          suffix: Icon(
                            Icons.send,
                            color: AppColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: AppColor,
                              ))),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Text('Loading .....');
          }
        });
  }
}
