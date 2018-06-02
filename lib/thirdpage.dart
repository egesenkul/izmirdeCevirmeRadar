import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:izmircevirme/main.dart';
import 'package:izmircevirme/newNewsPage.dart';
import 'package:izmircevirme/hakkimizda.dart';



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
  var Listindex;
  List data;
  List filtreli;
  List adminler;
  bool kullaniciAdmin=false;
  var index2;
  var dogruKonu="";
  var baslik="Haberler";
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://izmirdecevirme.azurewebsites.net/api/haber"),
        headers: {
          "Accept": "application/json"
        }
    );
    var response2 = await http.get(
        Uri.encodeFull("http://izmirdecevirme.azurewebsites.net/api/admin"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = JSON.decode(response.body);
      adminler=JSON.decode(response2.body);
      _listeFiltrele();
    });

    return "Success!";
  }
  @override
  void initState() {
    this.getData();
  }
  Widget build(BuildContext context) {
    _adminKontrol();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("$baslik"),
      ),
      drawer: new Drawer(
        child: kullaniciAdmin?
        new ListView(
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
                      builder: (context) => new NewNewsPage(ege:widget.value)));
                }
            ),
            new ListTile(
              title: new Text("Benim Gönderilerim"),
              trailing: new Icon(Icons.person),
              onTap: _kosulGuncelleBenimGonderilerim,
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 9.0),
              child: new Text("Kategoriler"),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Tümü"),
              trailing: new Icon(Icons.assignment),
              onTap: _tumu,
            ),
            new ListTile(
              title: new Text("Radarlar ve Çevirmeler"),
              trailing: new Icon(Icons.add_alert),
              onTap: _kosulGuncelleRadarlar,
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
            new Padding(
              padding: new EdgeInsets.only(left: 9.0),
              child: new Text("Yönetici Özel"),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Onaylanmamış Gönderiler"),
              trailing: new Icon(Icons.touch_app),
              enabled:kullaniciAdmin,
              onTap: _kosulGuncelleOnaylanmamisGonderiler,
            ),
            new Divider(),
            new ListTile(
                title: new Text("Hakkımızda"),
                trailing: new Icon(Icons.perm_device_information),
                onTap: () {
                  _onPress();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new hakkimizdaPage()));
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
        ):
        new ListView(
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
                      builder: (context) => new NewNewsPage(ege:widget.value)));
                }
            ),
            new ListTile(
              title: new Text("Benim Gönderilerim"),
              trailing: new Icon(Icons.person),
              onTap: _kosulGuncelleBenimGonderilerim,
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 9.0),
              child: new Text("Kategoriler"),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Tümü"),
              trailing: new Icon(Icons.assignment),
              onTap: _tumu,
            ),
            new ListTile(
              title: new Text("Radarlar ve Çevirmeler"),
              trailing: new Icon(Icons.add_alert),
              onTap: _kosulGuncelleRadarlar,
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
                title: new Text("Hakkımızda"),
                trailing: new Icon(Icons.perm_device_information),
                onTap: () {
                  _onPress();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new hakkimizdaPage()));
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
        itemCount: filtreli == null ? 0 : filtreli.length,
        itemBuilder: (BuildContext context, int index) {
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
                            image: new DecorationImage(image: new NetworkImage(filtreli[index]["gondericiResim"]))
                        ),
                      ),
                      new MaterialButton(onPressed: baslik=="Onaylanmamış Gönderiler"?()=>setState((){Listindex = index;}):null,child: new Text(filtreli[index]["gondericiAdi"],style: new TextStyle(fontWeight: FontWeight.bold)),)
                    ],
                  ),
                  new Image.network(
                    filtreli[index]["resimUrl"],
                  ),
                  new ListTile(
                    title: new Text(filtreli[index]["aciklama"],
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: new Text(filtreli[index]["konu"]),
                      onTap: baslik=="Onaylanmamış Gönderiler"?() => _onaylaConfirm(index):null
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
  
  void _kosulGuncelleBenimGonderilerim(){
    setState((){
      baslik="Benim Gönderilerim";
      _listeFiltrele();
      _geriGel();
    });
  }

  void _kosulGuncelleDuyurular(){
    setState((){
      baslik="Duyurular";
      _listeFiltrele();
      _geriGel();
    });
  }

  void _onaylaConfirm(var gonderiSira) {
    AlertDialog dialog = new AlertDialog(
      content: new Text("Gönderiyi onaylamak istediğinize emin misiniz?"),
      actions: <Widget>[
        new FlatButton(onPressed: ()=>_makePost(gonderiSira), child: new Text("Evet")),
        new FlatButton(onPressed: _onPress, child: new Text("Hayır")),
      ],
    );
    showDialog(context: context, child: dialog);
  }


  void _kosulGuncelleRadarlar(){
    setState((){
      baslik="Radarlar ve Çevirmeler";
      _listeFiltrele();
      _geriGel();
    });
  }

  void _kosulGuncelleKazalar(){
    setState((){
      baslik='Kazalar';
      _listeFiltrele();
      _geriGel();
    });
  }

  void _kosulGuncelleYolBilgisi(){
    setState((){
      baslik='Yol Bilgisi';
      _listeFiltrele();
      _geriGel();
    });
  }

  void _makePost(var sira) async{
    Dio dio = new Dio();
    Response response;
    response = await dio.post("http://izmirdecevirme.azurewebsites.net/api/haber",data: {"konu":filtreli[sira]["konu"],"aciklama":filtreli[sira]["aciklama"],"resimUrl":filtreli[sira]["resimUrl"],"gondericiAdi":filtreli[sira]["gondericiAdi"],"gondericiEmail":filtreli[sira]["gondericiEmail"],"gondericiResim":filtreli[sira]["gondericiResim"],"onay":"1"});
    print(response.data.toString());
    _geriGel();
  }

  void _kosulGuncelleCekiciler(){
    setState((){
      baslik='Çekiciler';
      _listeFiltrele();
      _geriGel();
    });
  }

  void _tumu(){
    setState((){
      baslik='Haberler';
      _listeFiltrele();
      _geriGel();
    });
  }

  void _kosulGuncelleKayipEsyalar(){
    setState((){
      baslik='Kayıp Eşyalar';
      _listeFiltrele();
      _geriGel();
    });
  }

  void _listeFiltrele(){
    filtreli = new List();
    for(int i=data.length-1;i>=0;i--){
      if(baslik.toString() == "Haberler"){
        if(data[i]["onay"]=="1"){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Onaylanmamış Gönderiler"){
        if(data[i]["onay"]=="0"){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Kayıp Eşyalar"){
        if(data[i]["konu"]=="Kayip Esyalar" && data[i]["onay"]=="1"){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Benim Gönderilerim"){
        if(data[i]["gondericiEmail"]==widget.value.email){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Kazalar"){
        if(data[i]["konu"]=="Kazalar"){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Radarlar ve Çevirmeler"){
        if(data[i]["konu"]=="Radarlar ve Çevirmeler"){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Yol Bilgisi"){
        if(data[i]["konu"]=="Yol Bilgisi"){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Çekiciler"){
        if(data[i]["konu"]=="Çekiciler"){
          filtreli.add(data[i]);
        }
      }
      else if(baslik.toString() == "Duyurular"){
        if(data[i]["konu"]=="Duyurular"){
          filtreli.add(data[i]);
        }
      }
    }
  }

  void _kosulGuncelleOnaylanmamisGonderiler(){
    this.setState(() {
      baslik="Onaylanmamış Gönderiler";
      _listeFiltrele();
      _geriGel();
    });
  }

  void _adminKontrol(){
    var i;
    if(adminler!=null){
      for(i=0;i<adminler.length;i++){
        if(adminler[i]["email"].toString()==widget.value.email){
          this.setState((){
            kullaniciAdmin=true;
          });
        }
      }
    }
  }

  void _onPress() {
    Navigator.of(context).pop();
  }

  void _cikisYap(){
     _onPress();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/MyApp', (Route<dynamic> route) => false);
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



