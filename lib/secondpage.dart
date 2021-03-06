import 'package:flutter/material.dart';

final ThemeData _themData = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.teal,
  buttonColor: Colors.red,
);

class SecondDartPAGE extends StatefulWidget {

  static const String routeName = "/SecondDartPAGE";

  @override
  _SecondDartPAGEState createState() => new _SecondDartPAGEState();
}

class _SecondDartPAGEState extends State<SecondDartPAGE> {
  @override
  Widget build(BuildContext context) {

    var _firstGroup = new Container(
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: new Padding(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Text("First Group"),
            new RaisedButton(
              child: new Text("First Button"),
              onPressed: _onPress,
            ),
          ],
        ),
      ),
    );

    var _secondGroup = new Container(
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: new Padding(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Text("Second Group"),
            new RaisedButton(
              child: new Text("Second Button"),
              onPressed: _onPress,
            ),
          ],
        ),
      ),
    );

    return new Theme(
      data: _themData,
      child: new Scaffold(
      appBar: new AppBar(
        title: new Text("Şifremi Unuttum Sayfası"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _firstGroup,
            _secondGroup,
          ],
        ),
      ),
      ),
    );
}
  void _onPress() {
    Navigator.of(context).pop();
  }
}

