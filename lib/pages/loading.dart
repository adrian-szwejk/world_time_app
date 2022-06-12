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
  void getData() async {
    //Uri breaks URL into parts and set it to a HTTP response to decode later
    Response response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    //Maps json string data into keys and values like a regular Hashmap
    Map data = jsonDecode(response.body);
    debugPrint("$data");
    debugPrint(data["title"]);
  }
  /*
  void getData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
    var response = await get(url);
    Map data = jsonDecode(response.body);
    debugPrint("$data");
    debugPrint(data['title']);
  }
  */

  //Created initState to set the initial state of the location screen
  @override
  void initState() {
    //Run the original function that we are overriding
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text("loading screen")),
    );
  }
}
