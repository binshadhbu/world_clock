
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time="1"; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime=true;

  WorldTime({ required this.location,required this.flag,required this.url });

  Future<void> getTime() async {
    try {
      Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      print(now);
      isDaytime=now.hour>6 && now.hour<18 ? true : false;

      // set the time property
      time = DateFormat.jm().format(now);

    }catch(error){
      print('caught error: $error');
    }
    // make the request

  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');