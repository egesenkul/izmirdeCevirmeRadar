import 'dart:async';
import 'package:flutter/material.dart';
import 'package:izmircevirme/fourthpage.dart';
import 'package:izmircevirme/secondpage.dart';
import 'package:izmircevirme/thirdpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() =>
    runApp(new MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      debugShowCheckedModeBanner: false,
      title: 'İzmir Çevirme Radar',
      // Sayfa Geçiş İşlemleri
      // Routes Oluştur
      routes: <String, WidgetBuilder>{
        // Sonra Sayfaları Tanıt
        // 2.Sayfa
        SecondDartPAGE.routeName:(BuildContext context) =>
        new SecondDartPAGE(),
        // 3.Sayfa
        ThirdDartPAGE.routeName: (BuildContext context) =>
        new ThirdDartPAGE(),
        // 4.Sayfa
        FourthDartPAGE.routeName: (BuildContext context) =>
        new FourthDartPAGE()
      },
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final FirebaseAuth authCevirme = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await authCevirme.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    return user;
  }
  void signOuy(){
    googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Container(
        child:
          new ListView(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              new Image(
                image: new AssetImage("assets/izmirde_cevirme_logo.png"),
                fit: BoxFit.cover,
              ),
              new Form(child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                        color: Colors.white70,
                        fontSize: 20.0
                    ),
                  ),
                ),
                child: new Container(
                  padding: const EdgeInsets.all(30.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: 'Kullanıcı Adı',
                        ),
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: 'Şifre',
                        ),
                        obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 55.0),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new MaterialButton(
                            height: 40.0,
                            minWidth: 140.0,
                            color: Colors.green,
                            textColor: Colors.white,
                            child: new Text("GİRİŞ"),
                            onPressed: ()=> signIn().then((FirebaseUser user)=>print(user)),
                            splashColor: Colors.redAccent,
                          ),
                          new MaterialButton(
                            height: 40.0,
                            minWidth: 80.0,
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            child: new Text("ŞİFREMİ UNUTTUM"),
                            onPressed: _sifremiUnuttumPage,
                            splashColor: Colors.redAccent,
                          ),
                        ],
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(top: 30.0),),
                          new MaterialButton(
                            height: 40.0,
                            minWidth: 220.0,
                            color: Colors.indigo,
                            textColor: Colors.white,
                            child: new Text("KAYIT OL"),
                            onPressed: _kayitolSayfasi,
                            splashColor: Colors.redAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              )

        ],
      ),
    ),
    );
  }

  void _sifremiUnuttumPage() {
    Navigator.of(context).pushNamed(SecondDartPAGE.routeName);
  }

  void _girisSayfasi() {
    Navigator.of(context).pushNamed(ThirdDartPAGE.routeName);
  }

  void _kayitolSayfasi() {
    Navigator.of(context).pushNamed(FourthDartPAGE.routeName);
  }
}
