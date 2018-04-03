import 'package:flutter/material.dart';

class NewNewsPage extends StatefulWidget {
  @override
  _NewNewsPageState createState() => new _NewNewsPageState();
}

class _NewNewsPageState extends State<NewNewsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Yeni Haber Sayfası"),
      ),
    );
  }
}
