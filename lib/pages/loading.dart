// import 'package:flutter/material.dart';
// import 'package:world_clock/services/world_time.dart';
//
// class Loading extends StatefulWidget {
//   const Loading({Key? key}) : super(key: key);
//
//   @override
//   State<Loading> createState() => _LoadingState();
// }
//
// class _LoadingState extends State<Loading> {
//   String time='loading';
//   void setupWorldTime() async{
//     WorldTime instance=WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');
//     print(instance.time);
//     setState(() {
//       time=instance.time;
//       print(time);
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     setupWorldTime();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Padding(
//         padding:const EdgeInsets.all(50),
//         child:Text('$time'),
//
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'kolkata', flag: 'germany.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        child:SpinKitRotatingPlain(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
