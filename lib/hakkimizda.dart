import 'package:flutter/material.dart';

class hakkimizdaPage extends StatelessWidget {
  static String tag = 'Hakkımızda';

  @override
  Widget build(BuildContext context) {
    final logo = new Padding(
        padding: const EdgeInsets.all(1.0),
        child:  new Image(
          image: new AssetImage('assets/izmirde_cevirme_logo.png'),
        ),
    );

    final merhaba = new Padding(
      padding: const EdgeInsets.all(1.0),
      child: new Text(
        'İzmir Trafik Çevirme',
        style: new TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final ilk_paragraf= new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        'Prograrımıza hoşgeldiniz. Bu program sizlere trafikteyken diğer insanlarala iletişim içinde kalmanız amacıyla yaratılmıştır.',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
    final ikinci_paragraf = new Padding(
      padding: const EdgeInsets.all(8.0),
      child:  new Text('Uygulama içerisinde yapılan her paylaşım paylaşan kişilerin sorumluluğundadır.',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),),
    );
    final ucuncu_paragraf = new Padding(
      padding: const EdgeInsets.all(8.0),
      child:  new Text('Bu uygulama SE 380 dersi kapsamında \n\n-Ege Şenkul, \n-Rıza Özonuk, \n-Onat Göksel tarafından oluşturulmuştur.',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),),
    );


    final sayfa =

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
                children: <Widget>[sayfa,logo,merhaba, ilk_paragraf,ikinci_paragraf,ucuncu_paragraf]
            ),
          ],
        )
    );

    return new Scaffold(
      body: body,
    );




  }

}
