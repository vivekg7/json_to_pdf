import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      body: _pdfPage1(),
    );
  }

  _saveFile() async {
    savePage1(widget.data);
    Navigator.pop(context);
  }

  final String date = DateFormat('yyy-MM-dd').format(DateTime.now());

  double h1=25, h2=20, h3=17, h4=14, p=10, s=5;

  Color c1 = Color.fromARGB(255, 178, 153, 153);
  Color c2 = Color.fromARGB(255, 178, 153, 127);

  Widget _paddingContainer() {
    return Container(padding: EdgeInsets.only(top: 2.0,bottom: 3.0), height: 6.0, child: Container(color: c2));
  }

  Widget _pdfPage1() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
          children: <Widget>[
            Row(children: <Widget>[Text("Page 1", textAlign: TextAlign.start,), Expanded(child: Container(),)],),
            Center(
              child: Text("Logo Here", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h1)),
            ),
            SizedBox(height: 3*s),
            Center(
                child: Text("Student Report Reasoning", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h2))
            ),
            SizedBox(height: s),
            Row(children: <Widget>[Text(date,style: TextStyle(fontWeight: FontWeight.normal, fontSize: p)),Expanded(child: Container())]),
            SizedBox(height: s),
            Row(children: <Widget>[Text("Name: ABC",style: TextStyle(fontWeight: FontWeight.bold, fontSize: h4)),Expanded(child: Container())]),
            SizedBox(height: s),
            Row(children: <Widget>[Text("Student ID: 123456789", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h4)),Expanded(child: Container())]),
            SizedBox(height: s),
            Row(children: <Widget>[Text("School: ABC National School", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h4)),Expanded(child: Container())]),
            SizedBox(height: s),
            Row(children: <Widget>[Text("Grade: 4", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h4)),Expanded(child: Container())]),
            SizedBox(height: s),
            Row(children: <Widget>[Text("Section: B", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h4)),Expanded(child: Container())]),
            SizedBox(height: 2*s),
            Row(children: <Widget>[Text("This ABC report provides results for the ABCTest (A bc) taken in November 2019", style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),Expanded(child: Container())]),
            Row(children: <Widget>[Text("in the following subject:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),Expanded(child: Container())]),
            SizedBox(height: 1.5*s),
            Container(height: 1.0, color: Colors.black),
            SizedBox(height: 2*s),
            Row(children: <Widget>[Text("Reasoning Level 4 Form A", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h4)),Expanded(child: Container())]),
            SizedBox(height: 1.5*s),
            Container(
              //color: PdfColors.redAccent700,
              //color: PdfColor.fromHex("#b584b8ff"),
              //color: PdfColor.fromInt(50),
              color: c1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: s),
                    Text(widget.data["Result"]["DashConstrantText"]["Head1"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Value1"], style: TextStyle(fontWeight: FontWeight.normal, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Head2"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Value2"], style: TextStyle(fontWeight: FontWeight.normal, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Head3"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Value3"], style: TextStyle(fontWeight: FontWeight.normal, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Head4"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Value4"], style: TextStyle(fontWeight: FontWeight.normal, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Head5"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Value5"], style: TextStyle(fontWeight: FontWeight.normal, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Head6"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: p)),
                    _paddingContainer(),
                    Text(widget.data["Result"]["DashConstrantText"]["Value6"], style: TextStyle(fontWeight: FontWeight.normal, fontSize: p)),
                    SizedBox(height: 2.0*s),
                  ]
              ),
            ),
            SizedBox(height: 4.0*s,),
            Container(height: 2.0, color: Colors.grey,),
          ]
      ),
    );
  }

}