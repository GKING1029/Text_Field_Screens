import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_field_screens/input_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var nameFocusnode = FocusNode();
  var phoneFocusnode = FocusNode();
  var emailFocusnode = FocusNode();
  var addressFocusnode = FocusNode();
  checkFunctions() {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter your name");
    } else if (phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter phone no.");
    } else if (phoneController.text.toString().length < 10) {
      Fluttertoast.showToast(msg: "Enter valid phone no.");
    } else if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter valid Email");
    } else if (addressController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter valid address");
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const Input_screen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("INFO",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 40,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Info",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text("Name",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 20,
                focusNode: nameFocusnode,
                onSubmitted: (value) {
                  checkFunctions();
                  phoneFocusnode.requestFocus();
                },
              ),
              const Text("Phone no.",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: phoneController,
                decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 10,
                focusNode: phoneFocusnode,
                onSubmitted: (value) {
                  if (phoneController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter phone no.");
                    phoneFocusnode.requestFocus();
                  } else if (phoneController.text.toString().length < 10) {
                    Fluttertoast.showToast(msg: "Enter valid phone no.");
                    phoneFocusnode.requestFocus();
                  } else {
                    emailFocusnode.requestFocus();
                  }
                },
              ),
              const Text("Email",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 50,
                focusNode: emailFocusnode,
                onSubmitted: (value) {
                  addressFocusnode.requestFocus();
                },
              ),
              const Text("Address",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 4))),
                style: const TextStyle(fontSize: 20),
                maxLines: 1,
                maxLength: 50,
                focusNode: addressFocusnode,
                onSubmitted: (value) {
                  checkFunctions();
                },
              ),
              Center(
                child: ElevatedButton(
                    style: const ButtonStyle(
                        shadowColor: MaterialStatePropertyAll(Colors.grey),
                        backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                    onPressed: () {
                      checkFunctions();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Input_screen())));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("Add now",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )),
              )
            ]),
      ),
    );
  }
}
