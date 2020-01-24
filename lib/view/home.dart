import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json To pdf"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {

          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Get Data"),
        ),
      ),
    );
  }

}