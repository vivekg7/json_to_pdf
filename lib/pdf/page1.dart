import 'dart:io';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';

void savePage1(data) async {
  final Document pdf = Document();

  final String date = DateFormat('yyy-MM-dd').format(DateTime.now());

  final fontReg = await rootBundle.load("assets/OpenSans-Regular.ttf");
  final fontBold = await rootBundle.load("assets/OpenSans-Bold.ttf");

  double h1=30, h2=24, h3=20, h4=18, p=12, s=5;

  PdfColor c0 = PdfColor(0.694, 0.624, 0.784); // Dark paragraph
  PdfColor c1 = PdfColor(0.816, 0.776, 0.871); // Light paragraph
  PdfColor c2 = PdfColor(0.835, 0.800, 0.882); // Even lighter

  Widget _paddingContainer() {
    return Container(padding: EdgeInsets.only(top: 2.0,bottom: 3.0), height: 6.0, child: Container(color: c2));
  }

  Widget _getTile(int idx) {
    return Container(
      padding: EdgeInsets.only(top: 0*s, bottom: 0*s),
      color: idx%2==0? c0:c1,
      child: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                Container(width: 1.0, height: 60.0, color: PdfColors.black),
                Expanded(
                  flex: 1,
                  child: Center(child: Text((idx+1).toString(), style: TextStyle(font: Font.ttf(fontReg),color: PdfColors.black,))),
                ),
                Container(width: 1.0, height: 60.0, color: PdfColors.black),
                Expanded(
                  flex: 15,
                  child: Center(
                      child: Text(
                          data["Result"]["DashQstDetails"][idx]["QuestionDescription"],
                          style: TextStyle(font: Font.ttf(fontReg),color: PdfColors.black, lineSpacing: 2.0)
                      )
                  ),
                ),
                Container(width: 1.0, height: 60.0, color: PdfColors.black),
                Expanded(
                  flex: 3,
                  child: Center(child: Text(data["Result"]["DashQstDetails"][idx]["Strand_Name"], style: TextStyle(font: Font.ttf(fontReg),color: PdfColors.black))),
                ),
                Container(width: 1.0, height: 60.0, color: PdfColors.black),
                Expanded(
                  flex: 2,
                  child: Center(child: Text(data["Result"]["DashQstDetails"][idx]["Result"].toString(), style: TextStyle(font: Font.ttf(fontReg),color: PdfColors.black))),
                ),
                Container(width: 1.0, height: 60.0, color: PdfColors.black),
              ]
          ),
          Container(height: 1.0, color: PdfColors.black),
        ]
      ),
    );
  }

  pdf.addPage(MultiPage(
    pageFormat: PdfPageFormat.a4,
    build: (Context context) => <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text("Logo Here", style: TextStyle(font: Font.ttf(fontBold), fontSize: h1)),
          ),
          SizedBox(height: 3*s),
          Center(
            child: Text("Student Report Reasoning", style: TextStyle(font: Font.ttf(fontBold), fontSize: h2))
          ),
          SizedBox(height: s),
          Row(children: <Widget>[Text(date,style: TextStyle(font: Font.ttf(fontReg), fontSize: p)),Expanded(child: Container())]),
          SizedBox(height: s),
          Text("Name: ABC",style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),
          SizedBox(height: s),
          Text("Student ID: 123456789", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),
          SizedBox(height: s),
          Text("School: ABC National School", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),
          SizedBox(height: s),
          Text("Grade: 4", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),
          SizedBox(height: s),
          Text("Section: B", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),
          SizedBox(height: 2*s),
          Text("This ABC report provides results for the ABCTest (A bc) taken in November 2019", style: TextStyle(font: Font.ttf(fontBold), fontSize: p)),
          Text("in the following subject:", style: TextStyle(font: Font.ttf(fontBold), fontSize: p)),
          SizedBox(height: 1.5*s),
          Container(height: 1.0, color: PdfColors.black),
          SizedBox(height: 2*s),
          Text("Reasoning Level 4 Form A", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),
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
                Text(data["Result"]["DashConstrantText"]["Head1"], style: TextStyle(font: Font.ttf(fontBold), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Value1"], style: TextStyle(font: Font.ttf(fontReg), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Head2"], style: TextStyle(font: Font.ttf(fontBold), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Value2"], style: TextStyle(font: Font.ttf(fontReg), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Head3"], style: TextStyle(font: Font.ttf(fontBold), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Value3"], style: TextStyle(font: Font.ttf(fontReg), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Head4"], style: TextStyle(font: Font.ttf(fontBold), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Value4"], style: TextStyle(font: Font.ttf(fontReg), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Head5"], style: TextStyle(font: Font.ttf(fontBold), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Value5"], style: TextStyle(font: Font.ttf(fontReg), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Head6"], style: TextStyle(font: Font.ttf(fontBold), fontSize: p, lineSpacing: 2.0)),
                _paddingContainer(),
                Text(data["Result"]["DashConstrantText"]["Value6"], style: TextStyle(font: Font.ttf(fontReg), fontSize: p, lineSpacing: 2.0)),
                SizedBox(height: 2.0*s),
              ]
            ),
          ),
        ]
      ),
      SizedBox(height: 2.0*s),
      Text("Performance on Each Question", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),
      Container(
        height: 30.0,
        color: PdfColors.black,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(child: Text("No.", style: TextStyle(font: Font.ttf(fontBold),color: PdfColors.white))),
            ),
            Expanded(
              flex: 15,
              child: Center(child: Text("Question Description", style: TextStyle(font: Font.ttf(fontBold),color: PdfColors.white))),
            ),
            Expanded(
              flex: 3,
              child: Center(child: Text("Strand", style: TextStyle(font: Font.ttf(fontBold),color: PdfColors.white))),
            ),
            Expanded(
              flex: 2,
              child: Center(child: Text("Result", style: TextStyle(font: Font.ttf(fontBold),color: PdfColors.white))),
            ),
          ]
        )
      ),
      _getTile(0), _getTile(1), _getTile(2), _getTile(3), _getTile(4), _getTile(5), _getTile(6), _getTile(7),
      _getTile(8), _getTile(9), _getTile(10), _getTile(11), _getTile(12), _getTile(13), _getTile(14), _getTile(15),
      _getTile(16), _getTile(17), _getTile(18), _getTile(19), _getTile(20), _getTile(21), _getTile(22), _getTile(23),
      _getTile(24), _getTile(25), _getTile(26), _getTile(27), _getTile(28), _getTile(29), _getTile(30), _getTile(31),
      _getTile(32), _getTile(33), _getTile(34), _getTile(35), _getTile(36), _getTile(37), _getTile(38), _getTile(39),
    ])
  );

  // Hello World :)
  pdf.addPage(Page(
    pageFormat: PdfPageFormat.a4,
    build: (Context context) {
      return Center(
        child: Text("Hello World", style: TextStyle(font: Font.ttf(fontReg))),
      );
    }
  ));

  final output = await getApplicationDocumentsDirectory();// getExternalStorageDirectory();
  final file = File("${output.path}/json_data.pdf");
  print("Saved To $file");
  await file.writeAsBytes(pdf.save());

  OpenFile.open(file.path);

}
