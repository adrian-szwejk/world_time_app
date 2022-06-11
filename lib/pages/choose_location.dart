import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //Created initState to set the initial state of the location screen
  @override
  void initState() {
    //Run the original function that we are overriding
    super.initState();
    debugPrint("initState function ran");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build function ran");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        centerTitle: true,
      ),
      body: const Text("Where do you live"),
    );
  }
}
