import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThenDialogScreen extends StatefulWidget {
  const ThenDialogScreen({super.key});

  @override
  State<ThenDialogScreen> createState() => _ThenDialogScreenState();
}

class _ThenDialogScreenState extends State<ThenDialogScreen> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "ThenDialog_Textfield",
                  counterText: "",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 4)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 4))),
              style: const TextStyle(fontSize: 20),
              maxLines: 1,
              maxLength: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
                onPressed: () {
                  if (nameController.text.toString().isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Something");
                  } else {
                    Navigator.of(context).pop(nameController.text.toString());
                  }
                },
                child: Text("OK")),
          )
        ],
      ),
    );
  }
}
