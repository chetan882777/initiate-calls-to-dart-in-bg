import 'package:flutter/material.dart';
import 'package:initiate_calls_to_dart_in_bg/initiate_calls_to_dart_in_bg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State createState() => MainScreenState();
}

class MainScreenState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    InitiateCalls.initialize();
  }

  static void callback(String s) async {
    print("I am from main.dart");
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Example'),
          ),
          body: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: RaisedButton(
                        child: const Text('Run'),
                        onPressed: () {
                          InitiateCalls.test(callback);
                        },
                      ),
                    ),
                  ]
              )
          )
      ),
    );
  }
}