import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = 'loading';
  //Functio to create instance of worldTime to use getTime function in here
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Chicago', flag: 'Chicago.png', url: 'America/Chicago');
    await instance.getTime();
    debugPrint(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  //Created initState to set the initial state of the location screen
  @override
  void initState() {
    //Run the original function that we are overriding
    super.initState();
    //Calls setupWorldTime function b/c that's the only way we can access the instance
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text("Current Time: $time"),
      ),
    );
  }
}
