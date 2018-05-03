import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static String tag = 'Hakkımızda';

  @override
  Widget build(BuildContext context) {

    final ege =

    new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        children: <Widget>[
          new IconButton(icon:
          new Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );

    final riza= new TextField(
      style: new TextStyle(color: Colors.white),
      decoration: new InputDecoration(
          border: InputBorder.none,
          hintStyle: new TextStyle(color: Colors.white),
          hintText: 'Yazı gir bakam'
      ),
    );

    final body = new Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(28.0),
    decoration: new BoxDecoration(
    gradient: new LinearGradient(colors: [
    Colors.blue,
    Colors.lightBlueAccent,
    ]),
    ),
    child: new ListView(
    children: <Widget>[
    new Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[ege,riza]
    ),
    ],
    )
    );

    return new Scaffold(
      body: body,
    );




  }

}
