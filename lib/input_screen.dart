import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_field_screens/dialog_screen.dart';
import 'package:text_field_screens/then_dialog_screen.dart';

class Input_Screen extends StatefulWidget {
  const Input_Screen({super.key});
  // final String name, password;
  // const Input_Screen({super.key, required this.name, required this.password});

  @override
  State<Input_Screen> createState() => _Input_ScreenState();
}

class _Input_ScreenState extends State<Input_Screen> implements OnClick {
  var textEditingController = TextEditingController();
  var collegeTextEditingController = TextEditingController();
  var editingTextFocusNode = FocusNode();
  var collegeTextFocusNode = FocusNode();

  // _Input_ScreenState(String name) {
  //   textEditingController.text = name;
  // }

  // @override
  // initState() {
  //   super.initState();
  //   print("name ${widget.name} password ${widget.password}");
  //   collegeTextEditingController.text = widget.password;
  //   setState(() {});
  // }

  checkValidation() {
    if (textEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter Something in Textfield 1");
    } else if (collegeTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter Something in Textfield 2");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("This is snackbar"),
          action: SnackBarAction(
              label: "Ok",
              onPressed: () {
                Fluttertoast.showToast(msg: "This is Flutertoast");
              })));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 86, 217, 250),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                focusNode: editingTextFocusNode,
                decoration: const InputDecoration(
                    hintText: "Textfield_1",
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 20,
                onSubmitted: (value) {
                  collegeTextFocusNode.requestFocus();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: collegeTextEditingController,
                focusNode: collegeTextFocusNode,
                decoration: const InputDecoration(
                    hintText: "Textfield_2",
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 20,
                onSubmitted: (value) {
                  checkValidation();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print(textEditingController.text);
                  checkValidation();
                },
                child: Text("Submit"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => InterfaceDialogScreen(
                              onClick: this,
                            ));
                  },
                  child: Text("Show Dialog")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => ThenDialogScreen()).then((value) {
                      if (value != null) {
                        textEditingController.text = value;
                        setState(() {});
                      }
                    });
                  },
                  child: Text("Show Then Dialog")),
            )
          ]),
        ));
  }

  @override
  void onClickFunction() {
    Fluttertoast.showToast(msg: "Button clicked");
  }
}
