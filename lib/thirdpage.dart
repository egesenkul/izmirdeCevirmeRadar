import 'dart:async';

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
  void GetUserInformations(){

  }
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
              accountName: new Text("Ege Şenkul", style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),),
              accountEmail: new Text("egesenkul35@hotmail.com",
                style: new TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),),
              currentAccountPicture: new GestureDetector(
                onTap: null,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/20729397_10155281919170617_5321691683692301674_n.jpg?_nc_cat=0&oh=c512bdc66bd2f6bf0c767d88b2573175&oe=5B2F10F0"),
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
                  _onPress();
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
            ),
            new ListTile(
              title: new Text("Yol Bilgisi"),
              trailing: new Icon(Icons.info),
            ),
            new ListTile(
              title: new Text("Çekiciler"),
              trailing: new Icon(Icons.drive_eta),
            ),
            new ListTile(
              title: new Text("Kayıp Eşyalar"),
              trailing: new Icon(Icons.feedback),
            ),
            new ListTile(
              title: new Text("Duyurular"),
              trailing: new Icon(Icons.error),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Onaylanmamış Gönderiler"),
              trailing: new Icon(Icons.touch_app),
              onTap: () => Navigator.of(context).pop(),
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
      body: new ListView(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 4.0),
           ),
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
                          image: new DecorationImage(image: new AssetImage('assets/hesap.jpg'))
                      ),
                    ),
                    new Text("Rıza Özonuk",style: new TextStyle(fontWeight: FontWeight.bold)),
                    new Expanded(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Icon(Icons.more_vert,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ],
                ),
                new Image.asset(
                  'assets/resim4.jpg',
                  width: 400.0,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
                new ListTile(
                  title: new Text(
                    "Amcalar Aydın Yolunda Bekliyor",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: new Text("Radarlar ve Çevirmeler "),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(Icons.favorite,color: Colors.red),
                    new Icon(Icons.chat_bubble_outline),
                    new Icon(Icons.turned_in_not),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                ),
              ],
            ),
          ),
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
                          image: new DecorationImage(image: new AssetImage('assets/sirma.jpg'))
                      ),
                    ),
                    new Text("Sırma Özsoydan",style: new TextStyle(fontWeight: FontWeight.bold)),
                    new Expanded(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Icon(Icons.more_vert,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ],
                ),
                new Image.asset(
                  'assets/resim1.jpg',
                  width: 400.0,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
                new ListTile(
                  title: new Text(
                    "Konak 4 Yol Ağzı Kaza",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: new Text("Kazalar"),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Icon(Icons.favorite,color: Colors.red),
                    new Icon(Icons.chat_bubble_outline),
                    new Icon(Icons.turned_in_not),
                  ],
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                ),
              ],
            ),
          ),
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
                            image: new DecorationImage(image: new AssetImage('assets/hande.jpg'))
                        ),
                      ),
                      new Text("Hande Orçan",style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Icon(Icons.more_vert,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Image.asset(
                    'assets/resim2.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.fill,
                  ),
                  new ListTile(
                    title: new Text(
                      "Alsancak Hamamcı Ayşeye Bırakıyom",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: new Text("Kayıp Eşyalar"),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Icon(Icons.favorite,color: Colors.red),
                      new Icon(Icons.chat_bubble_outline),
                      new Icon(Icons.turned_in_not),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
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
                            image: new DecorationImage(image: new AssetImage('assets/silan.jpg'))
                        ),
                      ),
                      new Text("Şilan Muhsinoğlu",style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Icon(Icons.more_vert,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Image.asset(
                    'assets/resim3.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.fill,
                  ),
                  new ListTile(
                    title: new Text(
                      "Bostanlı Sahil Pert",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: new Text("Yol Bilgisi"),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Icon(Icons.favorite,color: Colors.red),
                      new Icon(Icons.chat_bubble_outline),
                      new Icon(Icons.turned_in_not),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
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
                            image: new DecorationImage(image: new AssetImage('assets/ege.jpg'))
                        ),
                      ),
                      new Text("Ege Şenkul",style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Icon(Icons.more_vert,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Image.asset(
                    'assets/resim5.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.fill,
                  ),
                  new ListTile(
                    title: new Text(
                      "Ege Şenkul Evi Önü Kaza",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: new Text("Kazalar"),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Icon(Icons.favorite,color: Colors.red),
                      new Icon(Icons.chat_bubble_outline),
                      new Icon(Icons.turned_in_not),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
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
                            image: new DecorationImage(image: new AssetImage('assets/onat.jpg'))
                        ),
                      ),
                      new Text("Onat Göksel",style: new TextStyle(fontWeight: FontWeight.bold)),
                      new Expanded(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Icon(Icons.more_vert,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Image.asset(
                    'assets/resim6.jpg',
                    width: 400.0,
                    height: 300.0,
                    fit: BoxFit.fill,
                  ),
                  new ListTile(
                    title: new Text(
                      "Yeşilköy Giriş Radar",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: new Text("Radarlar ve Çevirmeler"),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Icon(Icons.favorite,color: Colors.red),
                      new Icon(Icons.chat_bubble_outline),
                      new Icon(Icons.turned_in_not),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }

  void _onPress() {
    Navigator.of(context).pop();
  }

  void _cikisOnay() {
    AlertDialog dialog = new AlertDialog(
      content: new Text("Çıkmak istediğinize emin misiniz?"),
      actions: <Widget>[
        new FlatButton(onPressed: null, child: new Text("Evet")),
        new FlatButton(onPressed: _onPress, child: new Text("Hayır")),
      ],

    );
    showDialog(context: context, child: dialog);
  }
}
