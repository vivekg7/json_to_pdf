import 'package:flutter/material.dart';
import 'package:json_to_pdf/pdf/page1.dart';

class PdfPage1 extends StatefulWidget {
  final data;
  PdfPage1(this.data);
  PdfPage1State createState() => PdfPage1State();
}

class PdfPage1State extends State<PdfPage1> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              _saveFile();
            },
          )
        ],
      ),
    );
  }

  _saveFile() async {
    savePage1(widget.data);
    Navigator.pop(context);
  }

}