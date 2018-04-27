import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static String tag = 'Hakkımızda';

  @override
  Widget build(BuildContext context) {
    final ege = new Hero(
      tag: 'hero',
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child:  new CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: new AssetImage('assets/ege.jpg'),
        ),
      ),
    );

    final merhaba = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        'İzmir Trafik Çevirme',
        style: new TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final hakkinda= new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        'Prograrımıza hoşgeldiniz. Bu program sizlere trafikteyken diğer insanlarala iletişim içinde kalmanız amacıyla yaratılmıştır',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
    final not = new Padding(
      padding: const EdgeInsets.all(8.0),
      child:  new Text('Not: Bu programın kötüye kullanılması uyarısız ban sebebidir.',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),),
    );
    final sorumluluk = new Padding(
      padding: const EdgeInsets.all(8.0),
      child:  new Text('Uygulama içerisinde yapılan her payşlsım',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),),
    );
    final odev = new Padding(
      padding: const EdgeInsets.all(8.0),
      child:  new Text('Bu uygulama şu ders için şu şu şu kişiler tarafından',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),),
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
      child: new Column(
        children: <Widget>[ege, merhaba, hakkinda,not,sorumluluk,odev]
      ),
    );

    return new Scaffold(
      body: body,
    );
  }
}
