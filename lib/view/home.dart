import 'package:flutter/material.dart';
import 'package:json_to_pdf/data/repository.dart';
import 'package:json_to_pdf/view/pdf_page1.dart';

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
            print("Hello World");
            _getData();
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Get Data"),
        ),
      ),
    );
  }

  _getData() async {
    var data = await AppRepository().getData(context);
    if (data != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPage1(data)));
    }
  }

}