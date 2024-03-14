import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceScreen extends StatefulWidget {
  const SharedPrefrenceScreen({super.key});

  @override
  State<SharedPrefrenceScreen> createState() => _SharedPrefrenceScreenState();
}

class _SharedPrefrenceScreenState extends State<SharedPrefrenceScreen> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  var count = 0;
  var formKey = GlobalKey<FormState>();
  late SharedPreferences _sharedPreferences;
  @override
  void initState() {
    super.initState();
    initialisePrefs();
  }

  void initialisePrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    if (_sharedPreferences.containsKey("Name")) {
      var savedData = _sharedPreferences.getString("Name");
      print("Name key $savedData");
      nameController.text = savedData ?? "";
    }

    if (_sharedPreferences.containsKey("Number")) {
      count = _sharedPreferences.getInt("Number") ?? 0;
      numberController.text = count.toString() ?? "";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 191, 191),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter Name",
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
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const Text("Enter Number",
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                controller: numberController,
                keyboardType: TextInputType.number,
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
                    return "Enter a Number";
                  } else if ((value?.length ?? 0) < 1) {
                    return "Enter only Number";
                  } else {
                    _sharedPreferences.setString(
                        "Name", nameController.text.toString());

                    _sharedPreferences.setInt(
                        "Number", int.tryParse(numberController.text) ?? 0);
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            _sharedPreferences.setString(
                                "Name", nameController.text.toString());

                            _sharedPreferences.setInt("Number",
                                int.tryParse(numberController.text) ?? 0);
                            setState(() {
                              count = int.tryParse(numberController.text) ?? 0;
                            });
                          }
                        },
                        child: Text("Save")),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: count,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return (Container(
                      color: Colors.black,
                    ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
