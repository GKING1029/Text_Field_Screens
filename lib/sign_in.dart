import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_field_screens/forgot_pass.dart';
import 'package:text_field_screens/sign_up.dart';

class SignInScreeen extends StatefulWidget {
  const SignInScreeen({super.key});

  @override
  State<SignInScreeen> createState() => _SignInScreeenState();
}

class _SignInScreeenState extends State<SignInScreeen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameFocusnode = FocusNode();
  var passwordFocusnode = FocusNode();
  var isPasswordEnabled = false;
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
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person_outlined,
                              size: 50,
                              color: Colors.blue,
                            ),
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.blue),
                            counterText: "",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 2.5))),
                        maxLength: 10,
                        focusNode: usernameFocusnode,
                        onSubmitted: (value) {
                          if (usernameController.text.isEmpty) {
                            Fluttertoast.showToast(msg: "Enter username");
                            usernameFocusnode.requestFocus();
                          } else if (usernameController.text.isNotEmpty) {
                            usernameFocusnode.unfocus();
                            setState(() {
                              isPasswordEnabled = true;
                            });
                          } else {
                            passwordFocusnode.requestFocus();
                          }
                        },
                        onEditingComplete: () {
                          usernameFocusnode.unfocus();
                          passwordFocusnode.requestFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        focusNode: passwordFocusnode,
                        enabled: isPasswordEnabled,
                        controller: passwordController,
                        decoration: InputDecoration(
                            enabled: passwordFocusnode.hasFocus,
                            icon: const Icon(
                              Icons.key_outlined,
                              size: 50,
                              color: Colors.blue,
                            ),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.blue),
                            counterText: "",
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 2.5))),
                        obscureText: true,
                        maxLength: 10,
                        onSubmitted: (value) {
                          if (passwordController.text.isEmpty) {
                            Fluttertoast.showToast(msg: "Enter password");
                            passwordFocusnode.requestFocus();
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const ForgotPassScreen())));
                            },
                            child: const Text("ForgotPassword!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Color.fromARGB(255, 110, 110, 110)))),
                        const Icon(
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Text("do not have a account!"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const SignUpScreen())));
                              },
                              child: const Text("SignUp",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)))
                        ],
                      ),
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
