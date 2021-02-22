import 'package:flutter/material.dart';
import 'package:javanese_date_converter/javanese_date_converter.dart';
import 'package:javanese_date_converter_example/j_content.dart';
import 'package:javanese_date_converter_example/j_title.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  JavaneseDate _javaneseDate;
  JavaneseDate _javaneseDateNow;

  @override
  void initState() {
    super.initState();
    _javaneseDate = JavaneseDate(day: 27, month: 7, year: 1999);
    _javaneseDateNow = JavaneseDate.fromDateTime(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Javanese Date Converter'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "My birthdate",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Table(
                    columnWidths: {0: FractionColumnWidth(.3)},
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        JTitle(text: "Weton"),
                        JTitle(text: "Dinapitu"),
                        JTitle(text: "Pasaran"),
                        JTitle(text: "Neptu"),
                      ]),
                      TableRow(children: [
                        JContent(text: "${_javaneseDate.wetonan.weton}"),
                        JContent(text: "${_javaneseDate.dinapitu}"),
                        JContent(text: "${_javaneseDate.pasaran.toString()}"),
                        JContent(text: "${_javaneseDate.wetonan.neptu}"),
                      ]),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Nowdate",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Table(
                    columnWidths: {0: FractionColumnWidth(.3)},
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        JTitle(text: "Weton"),
                        JTitle(text: "Dinapitu"),
                        JTitle(text: "Pasaran"),
                        JTitle(text: "Neptu"),
                      ]),
                      TableRow(children: [
                        JContent(text: "${_javaneseDateNow.wetonan.weton}"),
                        JContent(text: "${_javaneseDateNow.dinapitu}"),
                        JContent(text: "${_javaneseDateNow.pasaran.toString()}"),
                        JContent(text: "${_javaneseDateNow.wetonan.neptu}"),
                      ]),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
