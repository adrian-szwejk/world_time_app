import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //Button counter variable
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("build function ran");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        //$ added in text to modify show variable value in text
        child: Text("counter is $counter"),
      ),
    );
  }
}
