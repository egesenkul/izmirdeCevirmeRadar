import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:izmircevirme/main.dart';
import 'package:izmircevirme/newNewsPage.dart';
import 'package:izmircevirme/settingsPage.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ThirdDartPAGE extends StatefulWidget {
  final FirebaseUser value;
  static const String routeName = "/ThirdDartPAGE";
  ThirdDartPAGE ({Key key,this.value}) : super(key:key);
  @override
  _ThirdDartPAGEState createState() => new _ThirdDartPAGEState();
}

class _ThirdDartPAGEState extends State<ThirdDartPAGE> {
  List data;
  var kosul='';
  var dogruIfade='';
  var onayGerekli=true;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://izmirdecevirme.azurewebsites.net/api/haber"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });

    return "Success!";
  }
  @override
  void initState() {
    this.getData();
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Haberler"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("${widget.value.displayName}", style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),),
              accountEmail: new Text("${widget.value.email}",
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),),
              currentAccountPicture: new GestureDetector(
                onTap: null,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "${widget.value.photoUrl}"),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://bilgibirikimi.net/wp-content/uploads/2012/04/izmir-saat-kulesi.jpg"))
              ),
            ),
            new ListTile(
                title: new Text("Yeni Haber"),
                trailing: new Icon(Icons.add),
                onTap: () {
                  _onPress();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new NewNewsPage()));
                }

            ),
            new ListTile(
                title: new Text("Benim Gönderilerim"),
                trailing: new Icon(Icons.person),
                onTap: () {
                  _kosulGuncelleBenimGonderilerim;
                }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Tümü"),
              trailing: new Icon(Icons.assignment),
            ),
            new ListTile(
              title: new Text("Radarlar ve Çevirmeler"),
              trailing: new Icon(Icons.add_alert),
            ),
            new ListTile(
              title: new Text("Kazalar"),
              trailing: new Icon(Icons.block),
              onTap: _kosulGuncelleKazalar,
            ),
            new ListTile(
              title: new Text("Yol Bilgisi"),
              trailing: new Icon(Icons.info),
              onTap: _kosulGuncelleYolBilgisi,
            ),
            new ListTile(
              title: new Text("Çekiciler"),
              trailing: new Icon(Icons.drive_eta),
              onTap: _kosulGuncelleCekiciler,
            ),
            new ListTile(
              title: new Text("Kayıp Eşyalar"),
              trailing: new Icon(Icons.feedback),
              onTap: _kosulGuncelleKayipEsyalar,
            ),
            new ListTile(
              title: new Text("Duyurular"),
              trailing: new Icon(Icons.error),
              onTap: _kosulGuncelleDuyurular,
            ),
            new Divider(),
            new ListTile(
              title: new Text("Onaylanmamış Gönderiler"),
              trailing: new Icon(Icons.touch_app),
              onTap: _kosulGuncelleOnaylanmamisGonderiler,
            ),
            new Divider(),
            new ListTile(
                title: new Text("Hakkımızda"),
                trailing: new Icon(Icons.perm_device_information),
                onTap: () {
                  _onPress();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new SettingsPage()));
                }
            ),
            new ListTile(
                title: new Text("Ayarlar"),
                trailing: new Icon(Icons.settings),
                onTap: () {
                  _onPress();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new SettingsPage()));
                }
            ),
            new ListTile(
                title: new Text("Çıkış"),
                trailing: new Icon(Icons.power_settings_new),
                onTap: () {
                  _cikisOnay();
                }
            ),
          ],
        ),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          if(data[index][kosul].toString()==dogruIfade && data[index]["onay"].toString()==onayGerekli.toString() ){
          return
            new Card(
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: 60.0,
                        height: 60.0,
                        margin: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.black12),
                            shape: BoxShape.circle,
                            image: new DecorationImage(image: new NetworkImage(data[index]["gondericiResim"]))
                        ),
                      ),
                      new Text(data[index]["gondericiAdi"],style: new TextStyle(fontWeight: FontWeight.bold)),

                    ],
                  ),
                  new Image.network(
                    data[index]["resimUrl"],
                  ),
                  new ListTile(
                    title: new Text(data[index]["aciklama"],
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: new Text(data[index]["konu"]),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                ],
              ),
            );}
        },
      ),
    );
  }
  
  void _kosulGuncelleBenimGonderilerim(){
    setState((){
      kosul="gondericiEmail";
      dogruIfade="${widget.value.email}";
      onayGerekli=false;
    });
    _geriGel;
  }

  void _kosulGuncelleDuyurular(){
    setState((){
      kosul="konu";
      dogruIfade="Duyurular";
      onayGerekli=true;
    });
    _geriGel;
  }

  void _kosulGuncelleKazalar(){
    setState((){
      kosul="konu";
      dogruIfade="Kazalar";
      onayGerekli=true;
    });
    _geriGel;
  }

  void _kosulGuncelleYolBilgisi(){
    setState((){
      kosul="konu";
      dogruIfade="Yol Bilgisi";
      onayGerekli=true;
    });
    _geriGel;
  }

  void _kosulGuncelleCekiciler(){
    setState((){
      kosul="konu";
      dogruIfade="Çekiciler";
      onayGerekli=true;
    });
    _geriGel;
  }

  void _kosulGuncelleKayipEsyalar(){
    setState((){
      kosul="konu";
      dogruIfade="Kayıp Eşyalar";
      onayGerekli=true;
    });
    _geriGel;
  }

  void _kosulGuncelleOnaylanmamisGonderiler(){
    setState((){
      kosul="onay";
      dogruIfade="false";
      onayGerekli=false;
    });
    _geriGel;
  }

  void _onPress() {
    Navigator.of(context).pop();
  }

  void _cikisYap(){
    _onPress();
    Navigator.push(context, new MaterialPageRoute(
        builder: (context) => new MyApp()));
  }

  void _cikisOnay() {
    AlertDialog dialog = new AlertDialog(
      content: new Text("Çıkmak istediğinize emin misiniz?"),
      actions: <Widget>[
        new FlatButton(onPressed: _cikisYap, child: new Text("Evet")),
        new FlatButton(onPressed: _onPress, child: new Text("Hayır")),
      ],

    );
    showDialog(context: context, child: dialog);
  }

  void _geriGel(){
    Navigator.of(context).pop();
  }
}



