import 'package:flutter/material.dart';

abstract class OnClick {
  void onClickFunction();
}

class InterfaceDialogScreen extends StatefulWidget {
  final OnClick onClick;
  const InterfaceDialogScreen({super.key, required this.onClick});

  @override
  State<InterfaceDialogScreen> createState() => _InterfaceDialogScreenState();
}

class _InterfaceDialogScreenState extends State<InterfaceDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              widget.onClick.onClickFunction();
              Navigator.of(context).pop();
            },
            child: Text("Click me"),
          )
        ],
      ),
    );
  }
}
