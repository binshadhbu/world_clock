import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Map data={};
  // @override
  // Widget build(BuildContext context) {
  //   data = ModalRoute.of(context)!.settings.arguments as Map;
  //   print(data);
  Map data = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {
    parameters = ModalRoute.of(context)!.settings.arguments;
    Map data = jsonDecode(jsonEncode(parameters));
    return  Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.fromLTRB(0,150,0,0),
          child: Column(
            children:<Widget>[
              TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              ),
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Text(
                    data['location'],
                    style:TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height:20),
              Text(
                data['time'],
                style:TextStyle(
                  fontSize: 66,
                ),
              ),
            ],
    ),
        ),
      ),
    );
  }
}
