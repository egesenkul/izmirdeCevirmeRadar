import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:izmircevirme/thirdpage.dart';


class NewNewsPage extends StatefulWidget {
  @override
  _NewNewsPageState createState() => new _NewNewsPageState();
}

class _NewNewsPageState extends State<NewNewsPage> {
  String _value = null;
  List<String> _values = new List<String>();

  @override
  void initState() {
    _values.addAll([
      "Kazalar",
      "Kayıp Eşyalar",
      "Radarlar ve Çevirmeler",
      "Yol Bilgisi",
      "Çekiciler",
      "Duyurular"
    ]);
    _value = _values.elementAt(0);
  }

  void _onChangged(String value) {
    setState(() {
      _value = value;
    });
  }

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  final textfield = new TextEditingController();

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
              onPressed: _geriGel),
          title: new Text('Haber Oluştur'),
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
                      "Konu :",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new DropdownButton(
                      value: _value,
                      items: _values.map((String value) {
                        return new DropdownMenuItem(
                            value: value,
                            child: new Row(
                              children: <Widget>[new Text('${value}')],
                            ));
                      }).toList(),
                      onChanged: (String value) {
                        _onChangged(value);
                      },
                    ),
                  ],
                ),
                new TextField(
                  decoration: new InputDecoration(
                    labelText: 'Açıklama Girin',
                  ),
                  controller: textfield,
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Center(
                  child: _image == null
                      ? new Text('Resim seçilmedi')
                      : new Image.file(_image),
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new MaterialButton(
                  onPressed: getImage,
                  height: 40.0,
                  minWidth: 140.0,
                  color: Colors.green,
                  textColor: Colors.white,
                  child: new Text("Resim Seç"),
                  splashColor: Colors.redAccent,
                )
              ],
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _haberOnay,
          tooltip: 'Haber Oluştur',
          child: new Icon(Icons.send),
        ),
      ),
    );
  }

  void _geriGel(){
    Navigator.of(context).pop();
  }
  void _haberOnay() {
    AlertDialog dialog = new AlertDialog(
      content: new Text("Haberi yayınlamak istediğinize emin misiniz?"),
      actions: <Widget>[
        new FlatButton(onPressed: _makePost, child: new Text("Evet")),
        new FlatButton(onPressed: _geriGel, child: new Text("Hayır")),
      ],

    );
    showDialog(context: context, child: dialog);
  }

  void _makePost() async{
    Dio dio = new Dio();
    Response response;
    response = await dio.post("http://izmirdecevirme.azurewebsites.net/api/haber",data: {"konu":_value,"aciklama":textfield.text,"resimUrl":"http://yenierdekgazetesi.com/resimler/2017-5/31/1827209906635.jpg","gondericiAdi":"Ege Senkul","gondericiEmail":"egesenkul@gmail.com","gondericiResim":"https://firebasestorage.googleapis.com/v0/b/esfsf-a749e.appspot.com/o/ege.jpg?alt=media&token=9eae18b1-2d0d-49d1-8096-013a08247a17","onay":"1"});
    print(response.data.toString());
    _geriGel();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/ThirdDartPAGE', (Route<dynamic> route) => false);
  }
}
