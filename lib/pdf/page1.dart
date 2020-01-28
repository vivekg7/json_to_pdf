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

  PdfColor c1 = PdfColor.fromRYB(0.7, 0.6, 0.6);
  PdfColor c2 = PdfColor.fromRYB(0.7, 0.6, 0.5);

  Widget _paddingContainer() {
    return Container(padding: EdgeInsets.only(top: 2.0,bottom: 3.0), height: 6.0, child: Container(color: c2));
  }

  // Add Page 1
  pdf.addPage(Page(
    pageFormat: PdfPageFormat.a4,
    build: (Context context) {
      return Column(
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
          Row(children: <Widget>[Text("Name: ABC",style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),Expanded(child: Container())]),
          SizedBox(height: s),
          Row(children: <Widget>[Text("Student ID: 123456789", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),Expanded(child: Container())]),
          SizedBox(height: s),
          Row(children: <Widget>[Text("School: ABC National School", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),Expanded(child: Container())]),
          SizedBox(height: s),
          Row(children: <Widget>[Text("Grade: 4", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),Expanded(child: Container())]),
          SizedBox(height: s),
          Row(children: <Widget>[Text("Section: B", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),Expanded(child: Container())]),
          SizedBox(height: 2*s),
          Row(children: <Widget>[Text("This ABC report provides results for the ABCTest (A bc) taken in November 2019", style: TextStyle(font: Font.ttf(fontBold), fontSize: p)),Expanded(child: Container())]),
          Row(children: <Widget>[Text("in the following subject:", style: TextStyle(font: Font.ttf(fontBold), fontSize: p)),Expanded(child: Container())]),
          SizedBox(height: 1.5*s),
          Container(height: 1.0, color: PdfColors.black),
          SizedBox(height: 2*s),
          Row(children: <Widget>[Text("Reasoning Level 4 Form A", style: TextStyle(font: Font.ttf(fontBold), fontSize: h4)),Expanded(child: Container())]),
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
      );
    }
  ));

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
