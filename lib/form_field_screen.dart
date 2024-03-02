import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFormFieldScreen extends StatefulWidget {
  const TextFormFieldScreen({super.key});

  @override
  State<TextFormFieldScreen> createState() => _TextFormFieldScreenState();
}

class _TextFormFieldScreenState extends State<TextFormFieldScreen> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Userame",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 4)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 20,
                // focusNode: nameFocusnode,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Enter Username";
                  } else {
                    return null;
                  }
                },
              ),
              const Text("Password",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 4)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 20,
                // focusNode: nameFocusnode,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Enter Password";
                  } else if ((value?.length ?? 0) < 10) {
                    return "Enter valid Password";
                  } else {
                    return null;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {}
                        },
                        child: Text("Login")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
