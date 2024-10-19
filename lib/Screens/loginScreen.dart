import 'package:chatapp3/Screens/ChatScreen.dart';
import 'package:chatapp3/Screens/registerationScreen.dart';
import 'package:chatapp3/helper/ShowSnackBar.dart';
import 'package:chatapp3/widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/Button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
static String id ='Login Screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;

  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: AppColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
            child: Form(
               key: formKey,
              child: ListView(
              
                children: [
  //               Column(
  // mainAxisAlignment: MainAxisAlignment.center, // Centers the content
  // crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
  // children: [
  SizedBox(height: 60,),
    Image.asset(
      'assets/vecteezy_speech-bubble-talk-bubble-chat-bubble-icon-png-transparent_9664482.png',
      height: 100,
    ),
    // Set the space between image and text to 0
    Center(
      child: Text(
        'Chat App',
        style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
      ),
    ),
  // ],
// ),
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                     onChange: (data) {
                        email = data;
                      },
                    text: 'Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    obscureText: true,
                     onChange: (data) {
                        password = data;
                      },
                    text: 'Password'),
                  const SizedBox(
                    height: 15,
                  ),
                  SigningButton(
                      onTap: () async {
                        print('ya mosahel');

                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});

                          try {
                            await UserLogin();
                              Navigator.pushNamed(context,ChatScreen.id,arguments: email);
                            ShowSnackBar(context, 'Success');
                            print('offffffffffffffffffff');
                          } on FirebaseAuthException catch (e) {
                            print(e.code);
                            print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahh');
                            if (e.code == 'invalid-email') {
                              ShowSnackBar(context,
                                  'user-not-found');
                            } else if (e.code == 'invalid-credential') {
                              ShowSnackBar(context,
                                  'wrong-password');
                            }else {
                            ShowSnackBar(context, e.message ?? 'Login failed');
                          }
                        } catch (e) {
                          ShowSnackBar(context, 'An error occurred');
                        }
                        
                        
                        // else {

                        // }
                        isLoading = false;
                        setState(() {});}
                      },
                      ButtonText: 'Sign in'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterationScreen.id);
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> UserLogin() async {
    if (email != null && password != null) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } else {
      ShowSnackBar(context, 'Email or Password cannot be null');
    }
  }

 
}
