import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Setup empty map to receive time data
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //Setting data map w/ arguments pushed from Loading screen
    data = ModalRoute.of(context)!.settings.arguments as Map;
    debugPrint("$data");
    return Scaffold(
      //SafeArea widget makes sure it is visible for the user(within bounds of screen)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  //Navigator widget is a function used to push a different screen on top of current one with a name in this case (stacking screens)
                  Navigator.pushNamed(context, "/location");
                },
                icon: const Icon(Icons.edit_location),
                label: const Text("Edit Location"),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data['time'],
                style: const TextStyle(fontSize: 65.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
