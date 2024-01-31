import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  var countController = TextEditingController();
  var countFocus = FocusNode();
  var color = -1;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                          fixedSize: MaterialStatePropertyAll(Size(90, 30)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {
                        setState(() {
                          color = 0;
                        });
                      },
                      child: const Text(
                        "RED",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                          fixedSize: MaterialStatePropertyAll(Size(90, 30)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        setState(() {
                          color = 1;
                        });
                      },
                      child: const Text(
                        "BLUE",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                          fixedSize: MaterialStatePropertyAll(Size(90, 30)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () {
                        setState(() {
                          color = 2;
                        });
                      },
                      child: const Text(
                        "GREEN",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: countController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.numbers,
                            size: 36,
                            color: Colors.black,
                          ),
                          labelText: "Count",
                          labelStyle: TextStyle(color: Colors.black),
                          counterText: "",
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.5))),
                      maxLength: 2,
                      focusNode: countFocus,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        fixedSize: MaterialStatePropertyAll(Size(90, 30)),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.yellow)),
                    onPressed: () {
                      setState(() {
                        count = int.tryParse(countController.text) ?? 0;
                      });
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            color = -1;
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            fixedSize: MaterialStatePropertyAll(Size(90, 30)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.black,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: (((context, index) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: color == -1
                              ? Colors.white
                              : color == 0
                                  ? Colors.red
                                  : color == 1
                                      ? Colors.blue
                                      : Colors.green),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 36,
                          ),
                          Text("TEXT")
                        ],
                      ),
                    );
                  }))),
            ),
          ],
        ),
      ]),
    );
  }
}
