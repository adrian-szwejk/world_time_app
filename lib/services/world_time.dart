import 'package:flutter/material.dart';
import 'package:http/http.dart';
import "dart:convert";

class WorldTime {
  //Location name for the UI
  String? location;
  //Time in that location
  String? time;
  //url to asset Flag icon of the location from image folder
  String? flag;
  //location url for api endpoints
  String? url;
  //Constructor that expects to receive all these values when creating new instance
  WorldTime({this.location, this.flag, this.url});
  //Get time class for this file
  Future<void> getTime() async {
    try {
      //Url variable allows for different locations to be entered
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      debugPrint("$data");
      //Choose characters of offset that matter
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      //Crate DateTime object
      DateTime now = DateTime.parse(datetime);
      //Updates current time with offset
      now = now.add(Duration(hours: int.parse(offset)));
      //Sets time variable above w/ data
      time = now.toString();
    } catch (e) {
      //Try-catch to show error on screen if cannot get time
      debugPrint("CAUGHT ERROR: $e");
      time = "Could not get time data";
    }
  }
}
