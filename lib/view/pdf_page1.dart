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

  Color c0 = Color.fromARGB(255, 178, 160, 200);
  Color c1 = Color.fromARGB(255, 209, 198, 222);
  Color c2 = Color.fromARGB(255, 203, 204, 225);

  Widget _paddingContainer() {
    return Container(padding: EdgeInsets.only(top: 2.0,bottom: 3.0), height: 6.0, child: Container(color: c2));
  }

  Widget _getTile(int idx) {
    return Container(
      padding: EdgeInsets.only(left: 2.0*s, right: 2.0*s),
      child: Container(
        padding: EdgeInsets.only(top: 0*s, bottom: 0*s),
        color: idx%2==0? c0:c1,
        child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Container(width: 1.0, height: 60.0, color: Colors.black),
                    Expanded(
                      flex: 1,
                      child: Center(child: Text((idx+1).toString(), style: TextStyle(color: Colors.black, fontSize: p))),
                    ),
                    Container(width: 1.0, height: 60.0, color: Colors.black),
                    Expanded(
                      flex: 15,
                      child: Center(
                          child: Text(
                              widget.data["Result"]["DashQstDetails"][idx]["QuestionDescription"],
                              style: TextStyle(color: Colors.black, fontSize: p)
                          )
                      ),
                    ),
                    Container(width: 1.0, height: 60.0, color: Colors.black),
                    Expanded(
                      flex: 3,
                      child: Center(child: Text(widget.data["Result"]["DashQstDetails"][idx]["Strand_Name"], style: TextStyle(color: Colors.black, fontSize: p))),
                    ),
                    Container(width: 1.0, height: 60.0, color: Colors.black),
                    Expanded(
                      flex: 2,
                      child: Center(child: Text(widget.data["Result"]["DashQstDetails"][idx]["Result"].toString(), style: TextStyle(color: Colors.black, fontSize: p))),
                    ),
                    Container(width: 1.0, height: 60.0, color: Colors.black),
                  ]
              ),
              Container(height: 1.0, color: Colors.black),
            ]
        ),
      ),
    );
  }

  Widget _pdfPage1() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(2.0*s),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text("Logo Here", style: TextStyle(fontSize: h1)),
                ),
                SizedBox(height: 3*s),
                Center(
                    child: Text("Student Report Reasoning", style: TextStyle(fontSize: h2))
                ),
                SizedBox(height: s),
                Row(children: <Widget>[Text(date,style: TextStyle(fontSize: p)),Expanded(child: Container())]),
                SizedBox(height: s),
                Text("Name: ABC",style: TextStyle(fontSize: h4)),
                SizedBox(height: s),
                Text("Student ID: 123456789", style: TextStyle(fontSize: h4)),
                SizedBox(height: s),
                Text("School: ABC National School", style: TextStyle(fontSize: h4)),
                SizedBox(height: s),
                Text("Grade: 4", style: TextStyle(fontSize: h4)),
                SizedBox(height: s),
                Text("Section: B", style: TextStyle(fontSize: h4)),
                SizedBox(height: 2*s),
                Text("This ABC report provides results for the ABCTest (A bc) taken in November 2019", style: TextStyle(fontSize: p)),
                Text("in the following subject:", style: TextStyle(fontSize: p)),
                SizedBox(height: 1.5*s),
                Container(height: 1.0, color: Colors.black),
                SizedBox(height: 2*s),
                Text("Reasoning Level 4 Form A", style: TextStyle(fontSize: h4)),
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
              ]
          ),
        ),
        SizedBox(height: 2.0*s),
        Padding(padding: EdgeInsets.all(2.0*s), child: Text("Performance on Each Question", style: TextStyle(fontWeight: FontWeight.bold, fontSize: h4)),),
        Container(
          padding: EdgeInsets.only(left: 2.0*s, right: 2.0*s),
          child: Container(
              height: 30.0,
              color: Colors.black,
              child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(child: Text("No.", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: p))),
                    ),
                    Expanded(
                      flex: 15,
                      child: Center(child: Text("Question Description", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: p))),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(child: Text("Strand", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: p))),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(child: Text("Result", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: p))),
                    ),
                  ]
              )
          ),
        ),
        _getTile(0), _getTile(1), _getTile(2), _getTile(3), _getTile(4), _getTile(5), _getTile(6), _getTile(7),
        _getTile(8), _getTile(9), _getTile(10), _getTile(11), _getTile(12), _getTile(13), _getTile(14), _getTile(15),
        _getTile(16), _getTile(17), _getTile(18), _getTile(19), _getTile(20), _getTile(21), _getTile(22), _getTile(23),
        _getTile(24), _getTile(25), _getTile(26), _getTile(27), _getTile(28), _getTile(29), _getTile(30), _getTile(31),
        _getTile(32), _getTile(33), _getTile(34), _getTile(35), _getTile(36), _getTile(37), _getTile(38), _getTile(39),
      ],
    );
  }

}