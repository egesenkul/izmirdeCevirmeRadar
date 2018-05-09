import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(icon: new Icon(Icons.arrow_back_ios),
              onPressed: () {
        Navigator.of(context).pop();
        }),
          title: new Text('Admin Ata'),
        ),
        body: new ListView(
          padding: new EdgeInsets.all(32.0),
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Mail Adresi :",
                      style: new TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                new TextField(
                  decoration: new InputDecoration(
                    labelText: 'mail@izmirdecevirme.com',
                  ),
                  controller: null,
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),

              ],
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: null,
          tooltip: 'Haber Oluştur',
          child: new Icon(Icons.send),
        ),
      ),
    );
  }

}
