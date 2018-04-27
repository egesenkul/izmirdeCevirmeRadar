import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static String tag = 'Hakkımızda';

  @override
  Widget build(BuildContext context) {
    final ege = new Hero(
      tag: 'hero',
      child: new Padding(
        padding: EdgeInsets.all(16.0),
        child:  new CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/ege.jpg'),
        ),
      ),
    );

    final merhaba = new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Text(
        'İzmir Trafik Çevirmeye Hoşgeldiniz',
        style: new TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final hakkinda= new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Text(
        'Prograrımıza hoşgeldiniz. Bu program sizlere trafikteyken diğer insanlarala iletişim içinde kalmanız amacıyka yaratılmıştır',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
    final not = new Padding(
      padding: EdgeInsets.all(8.0),
      child:  new Text('Not: Bu programın kötüye kullanılması uyarısız ban sebebidir.'),
    );


    final body = new Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: new Column(
        children: <Widget>[ege, merhaba, hakkinda,not]
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
