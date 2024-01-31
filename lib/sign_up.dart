import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_field_screens/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var usernameFocusnode = FocusNode();
  var passwordFocusnode = FocusNode();
  var emailFocusnode = FocusNode();
  var phoneFocusnode = FocusNode();
  var isPasswordEnabled = false;
  var isEmailEnabled = false;
  var isPhoneEnabled = false;

  checkFunctions() {
    if (usernameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter username");
    } else if (phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter phone no.");
    } else if (phoneController.text.toString().length < 10) {
      Fluttertoast.showToast(msg: "Enter valid phone no.");
    } else if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter valid Email");
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter password");
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const SignInScreeen())));
    }
  }

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
                height: MediaQuery.of(context).size.height / 1.291,
                width: MediaQuery.of(context).size.width / 3,
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
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person_outlined,
                              size: 36,
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
                            usernameFocusnode.requestFocus();
                          } else {
                            isPasswordEnabled = true;
                            passwordFocusnode.requestFocus();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: TextField(
                        enabled: isPasswordEnabled,
                        controller: passwordController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.key_outlined,
                              size: 36,
                              color: Colors.blue,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.blue),
                            counterText: "",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue, width: 2.5))),
                        obscureText: true,
                        maxLength: 10,
                        focusNode: passwordFocusnode,
                        onSubmitted: (value) {
                          if (passwordController.text.isEmpty) {
                            passwordFocusnode.requestFocus();
                          } else {
                            isEmailEnabled = true;
                            emailFocusnode.requestFocus();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: TextField(
                        enabled: isEmailEnabled,
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
                            emailFocusnode.requestFocus();
                          } else {
                            isPhoneEnabled = true;
                            phoneFocusnode.requestFocus();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: TextField(
                          enabled: isPhoneEnabled,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: phoneController,
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                size: 36,
                                color: Colors.blue,
                              ),
                              labelText: "Phone No.",
                              labelStyle: TextStyle(color: Colors.blue),
                              counterText: "",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.5))),
                          maxLength: 10,
                          focusNode: phoneFocusnode,
                          onSubmitted: (value) {
                            if (phoneController.text.isEmpty) {
                              Fluttertoast.showToast(msg: "Enter phone no.");
                              phoneFocusnode.requestFocus();
                            } else if (phoneController.text.toString().length <
                                10) {
                              Fluttertoast.showToast(
                                  msg: "Enter valid phone no.");
                              phoneFocusnode.requestFocus();
                            } else {
                              checkFunctions();
                            }
                          }),
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
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("already have a account!"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const SignInScreeen())));
                              },
                              child: const Text("SignIn",
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
                Icon(Icons.circle, color: Colors.blue, size: 38, shadows: [
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
