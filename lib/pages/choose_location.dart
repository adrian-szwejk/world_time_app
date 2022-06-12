import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //Button counter variable
  int counter = 0;
  //add async between parenthesis & curly brackets to add await to Future
  void getData() async {
    //Simulate a network request for a username from a database for ex.
    //Adding await in from makes the system wait for this Future to be done before starting the next
    String username = await Future.delayed(const Duration(seconds: 3), () {
      //Can set the returned value to a variable after the await
      return "chicken man";
    });
    //Simulate network request to get bio of the username
    String bio = await Future.delayed(const Duration(seconds: 2), () {
      return "climber, programmer, nerd";
    });
    //Has to wait until both values are returned
    debugPrint("$username - $bio");
    //Since it's async it will not block anything else in the app(allowing you to do other stuff)
  }

  //Created initState to set the initial state of the location screen
  @override
  void initState() {
    //Run the original function that we are overriding
    super.initState();
    debugPrint("initState function ran");
    getData();
  }

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
