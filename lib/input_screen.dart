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
    return const Scaffold(
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up,
                  size: 100,
                  shadows: [
                    Shadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(2, 5))
                  ],
                ),
                Text(
                  "Nice",
                  style: TextStyle(fontSize: 50, shadows: [
                    Shadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(2, 5))
                  ]),
                )
              ],
            )
          ]),
    );
  }
}
