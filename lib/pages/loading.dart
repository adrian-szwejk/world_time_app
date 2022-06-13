import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Functio to create instance of worldTime to use getTime function in here
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Chicago', flag: 'Chicago.png', url: 'America/Chicago');
    await instance.getTime();
    //Error to help with sending buildContexts over async functions
    //VIEW LOADING: Comment all code below in this fn to preview loading spinner
    if (!mounted) return;
    //After getting time go to home screen w/ 3 parameters or time data
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
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
      backgroundColor: Colors.lightBlue[200],
      body: const Center(
        //Spinning circle to replace loading text to show while app is loading up
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
