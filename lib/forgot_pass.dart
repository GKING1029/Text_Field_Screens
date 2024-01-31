import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_field_screens/otp_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  var emailController = TextEditingController();

  var emailFocusnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.circle, color: Colors.blue, size: 70, shadows: [
                Shadow(color: Colors.grey, blurRadius: 3, offset: Offset(-5, 5))
              ])
            ],
          ),
          Stack(children: [
            Container(
                height: 400,
                width: 250,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(117, 0, 0, 0),
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(2, 5))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.email,
                              size: 36,
                              color: Colors.blue,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.blue),
                            counterText: "",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 2.5))),
                        maxLength: 30,
                        focusNode: emailFocusnode,
                        onSubmitted: (value) {
                          if (emailController.text.isEmpty) {
                            Fluttertoast.showToast(msg: "Enter email");
                            emailFocusnode.requestFocus();
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => OTPScreen())));
                          }
                        },
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.arrow_circle_right,
                          color: Colors.blue,
                          size: 40,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                blurRadius: 6,
                                offset: Offset(2, .5))
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          ]),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.circle, color: Colors.blue, size: 70, shadows: [
                  Shadow(
                      color: Colors.grey, blurRadius: 3, offset: Offset(5, 5))
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
