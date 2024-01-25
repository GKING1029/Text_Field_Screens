import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Input_screen extends StatefulWidget {
  const Input_screen({super.key});

  @override
  State<Input_screen> createState() => _Input_screenState();
}

class _Input_screenState extends State<Input_screen> {
  var textEditingController = TextEditingController();
  var collegeTextEditingController = TextEditingController();
  var textFocusNode = FocusNode();
  var collegeFocusNode = FocusNode();
  checkFunctions() {
    if (textEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter something");
    } else if (collegeTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter college name");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: textEditingController,
          style: TextStyle(fontSize: 20),
          maxLines: 1,
          maxLength: 1,
          focusNode: textFocusNode,
          onSubmitted: (value) {
            collegeFocusNode.requestFocus();
          },
        ),
        TextField(
          controller: collegeTextEditingController,
          focusNode: collegeFocusNode,
          style: TextStyle(fontSize: 20),
          onSubmitted: (value) {
            checkFunctions();
          },
        ),
        GestureDetector(
            onTap: () {
              print(textEditingController.text);
              checkFunctions();
            },
            child: Text("Get value"))
      ]),
    );
  }
}
