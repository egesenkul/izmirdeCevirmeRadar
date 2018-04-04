import 'package:flutter/material.dart';
import 'package:izmircevirme/main.dart';
import 'package:izmircevirme/newNewsPage.dart';
import 'package:izmircevirme/settingsPage.dart';

class ThirdDartPAGE extends StatefulWidget {

  static const String routeName = "/ThirdDartPAGE";

  @override
  _ThirdDartPAGEState createState() => new _ThirdDartPAGEState();
}

class _ThirdDartPAGEState extends State<ThirdDartPAGE> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Haberler"),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ege Şenkul",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              accountEmail: new Text("egesenkul35@hotmail.com",style:new TextStyle(fontWeight: FontWeight.bold,color: Colors.white) ,),
              currentAccountPicture: new GestureDetector(
                onTap: null,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage("https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/20729397_10155281919170617_5321691683692301674_n.jpg?_nc_cat=0&oh=c512bdc66bd2f6bf0c767d88b2573175&oe=5B2F10F0"),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit:BoxFit.fill,
                      image: new NetworkImage("https://bilgibirikimi.net/wp-content/uploads/2012/04/izmir-saat-kulesi.jpg"))
              ),
            ),
            new ListTile(
              title:  new Text("Yeni Haber"),
              trailing: new Icon(Icons.add),
              onTap: () {
                _onPress();
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewNewsPage()));
              }
            ),
            new ListTile(
                title:  new Text("Benim Gönderilerim"),
                trailing: new Icon(Icons.person),
                onTap: () {
                  _onPress();
                }
            ),
            new Divider(),
            new ListTile(
              title:  new Text("Tümü"),
              trailing: new Icon(Icons.assignment),
            ),
            new ListTile(
              title:  new Text("Radarlar ve Çevirmeler"),
              trailing: new Icon(Icons.add_alert),
            ),
            new ListTile(
              title:  new Text("Kazalar"),
              trailing: new Icon(Icons.block),
            ),
            new ListTile(
              title:  new Text("Yol Bilgisi"),
              trailing: new Icon(Icons.info),
            ),
            new ListTile(
              title:  new Text("Çekiciler"),
              trailing: new Icon(Icons.drive_eta),
            ),
            new ListTile(
              title:  new Text("Kayıp Eşyalar"),
              trailing: new Icon(Icons.feedback),
            ),
            new ListTile(
              title:  new Text("Duyurular"),
              trailing: new Icon(Icons.error),
            ),
            new Divider(),
            new ListTile(
              title:  new Text("Onaylanmamış Gönderiler"),
              trailing: new Icon(Icons.touch_app),
              onTap: ()=>  Navigator.of(context).pop(),
            ),
            new Divider(),
            new ListTile(
                title:  new Text("Hakkımızda"),
                trailing: new Icon(Icons.perm_device_information),
                onTap: () {
                  _onPress();
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SettingsPage()));
                }
            ),
            new ListTile(
              title:  new Text("Ayarlar"),
              trailing: new Icon(Icons.settings),
                onTap: () {
                  _onPress();
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SettingsPage()));
                }
            ),
            new ListTile(
              title:  new Text("Çıkış"),
              trailing: new Icon(Icons.power_settings_new),
                onTap: () {
                _onPress();
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp()));
                }
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Image.asset("assets/izmirde_cevirme_logo.png"),
            title: new Text("İzmir'den çıkarken Çeşme Otobanı Radar",style: new TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text('Radarlar ve Çevirmeler'),
          ),
          new ListTile(
            leading: new Image.asset("assets/izmirde_cevirme_logo.png"),
            title: new Text("Dokuz Eylül Hastanesi Çekiyorlar",style: new TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text('Çekiciler'),
          ),
          new ListTile(
            leading: new Image.asset("assets/izmirde_cevirme_logo.png"),
            title: new Text("Uçanyol Yaralanmalı Kaza",style: new TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text('Kazalar'),
          ),
          new ListTile(
            leading: new Image.asset("assets/izmirde_cevirme_logo.png"),
            title: new Text("Ata Caddesi Tıkalı",style: new TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text('Yol Bilgisi'),
          ),
          new ListTile(
            leading: new Image.asset("assets/izmirde_cevirme_logo.png"),
            title: new Text("Ekonomi Çekiyorlar",style: new TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text('Çekiciler'),
          ),
          new ListTile(
            leading: new Image.asset("assets/izmirde_cevirme_logo.png"),
            title: new Text("Sahibi Onat Büfe'den Alabilir",style: new TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text('Kayıp Eşyalar'),
          ),
          new ListTile(
            leading: new Image.asset("assets/izmirde_cevirme_logo.png"),
            title: new Text("Mobil Uygulamamız Yayınlanmıştır",style: new TextStyle(fontWeight: FontWeight.bold),),
            subtitle: new Text('Duyurular'),
          ),
        ],
      ),
    );
  }
  void _onPress() {
    Navigator.of(context).pop();
  }
}
