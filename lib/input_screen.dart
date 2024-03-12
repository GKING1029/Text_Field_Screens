// ignore_for_file: avoid_print, camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_field_screens/dialog_screen.dart';
import 'package:text_field_screens/then_dialog_screen.dart';

class Input_Screen extends StatefulWidget {
  const Input_Screen({super.key});
  @override
  State<Input_Screen> createState() => _Input_ScreenState();
}

class _Input_ScreenState extends State<Input_Screen> implements OnClick {
  var textEditingController = TextEditingController();
  var collegeTextEditingController = TextEditingController();
  var editingTextFocusNode = FocusNode();
  var collegeTextFocusNode = FocusNode();
  checkValidation() {
    if (textEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter Something in Textfield 1");
    } else if (collegeTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter Something in Textfield 2");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("This is snackbar"),
          action: SnackBarAction(
              label: "Ok",
              onPressed: () {
                Fluttertoast.showToast(msg: "This is FluterToast");
              })));
    }
  }

  var textValue = 0;
  var _currentSliderPrimaryValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 86, 217, 250),
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
                child: const Text("Submit"),
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
                  child: const Text("Show Dialog")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                            context: context,
                            builder: (context) => const ThenDialogScreen())
                        .then((value) {
                      if (value != null) {
                        textEditingController.text = value;
                        setState(() {});
                      }
                    });
                  },
                  child: const Text("Show Then Dialog")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                              builder: (context, bottomState) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text(
                                    "$textValue",
                                    style: TextStyle(fontSize: 40),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        textValue++;
                                        textEditingController.text =
                                            textValue.toString();

                                        bottomState(() {});
                                      },
                                      child: Text("Increment Value")),
                                ],
                              ),
                            );
                          });
                        });
                  },
                  child: Text("Show Bottomsheet Dialog")),
            ),
            Padding(
                padding: EdgeInsets.all(4),
                child: OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, bottomState) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("Update the progress bar"),
                                    Slider(
                                      value: _currentSliderPrimaryValue,
                                      min: 0,
                                      max: 1000,
                                      onChanged: (value) {
                                        bottomState(() {
                                          _currentSliderPrimaryValue = value;
                                          collegeTextEditingController.text =
                                              value.toString();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                          });
                    },
                    child: Text("Show Modal Bottomsheet")))
          ]),
        ));
  }

  @override
  void onClickFunction() {
    Fluttertoast.showToast(msg: "Button clicked");
  }
}
