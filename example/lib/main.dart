import 'package:flutter/material.dart';
import 'package:ifonly_example/widget/invalid_button.dart';
import 'package:ifonly_example/widget/valid_button.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:ifonly/ifonly.dart';

part 'section/class_section.dart';
part 'section/textfield_section.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IfOnly Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        primaryColorDark: Colors.white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext scContext) => SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20.0),
              child: Column(
                children: <Widget>[
                  TextfieldSection(scaffoldContext: scContext),
                  Container(
                    child: Divider(),
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  ClassSection(scaffoldContext: scContext),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
