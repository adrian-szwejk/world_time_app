import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import "dart:convert";

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //add async between parenthesis & curly brackets to add await to Future
  void getTime() async {
    //Make the request
    Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/America/Chicago"));
    Map data = jsonDecode(response.body);
    debugPrint("$data");
    String datetime = data['datetime'];
    //Choose characters of offset that matter
    String offset = data['utc_offset'].substring(0, 3);
    //Crate DateTime object
    DateTime now = DateTime.parse(datetime);
    //Updates current time with offset
    now = now.add(Duration(hours: int.parse(offset)));
    debugPrint("$now");
  }

  //Created initState to set the initial state of the location screen
  @override
  void initState() {
    //Run the original function that we are overriding
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text("loading screen")),
    );
  }
}
