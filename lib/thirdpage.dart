import 'package:flutter/material.dart';

class ThirdDartPAGE extends StatefulWidget {

  static const String routeName = "/ThirdDartPAGE";

  @override
  _ThirdDartPAGEState createState() => new _ThirdDartPAGEState();
}

class _ThirdDartPAGEState extends State<ThirdDartPAGE> {
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Giriş Sayfası"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            _firstGroup,
            _secondGroup,
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        tooltip: 'Add',
        onPressed: null,
      ),
    );
  }
  void _onPress() {
    Navigator.of(context).pop();
  }
}
