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
    var _user=user;
    var route = new MaterialPageRoute(
      builder: (BuildContext context) =>
      new ThirdDartPAGE(value: _user),
    );
    Navigator.of(context).push(route);
    return user;
  }
  void signOut(){
    googleSignIn.signOut();
  }

  void giris(){
    final user = signIn();
        if(user!=null){
        _girisSayfasi;
    }
  }

  @override
  void initState() {
    super.initState();
  }
  Color c = const Color.fromARGB(255, 66, 165, 245);  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: c,
      body: new Container(
        child:
          new ListView(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left:30.0,top:30.0),
                child: new RichText(
                  text: new TextSpan(
                    text: "izmirde",
                    style:  new TextStyle(fontWeight: FontWeight.bold,fontFamily:'Ubuntu',fontSize:80.0,color: Colors.white70),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(left:30.0,bottom:30.0),
                child: new RichText(
                  text: new TextSpan(
                    text: "Trafik Çevirme Radar",
                    style:  new TextStyle(fontWeight: FontWeight.w400,fontFamily:'Ubuntu',fontSize:15.0,color: Colors.white70),
                  ),
                ),
              ),
              new Padding(
                padding:const EdgeInsets.only(left:30.0,top:40.0),
              ),
              new Center(
                child: new RichText(
                  text: new TextSpan(
                    text: "Hoşgeldiniz !",
                    style:  new TextStyle(fontWeight: FontWeight.w500,fontFamily:'Ubuntu',fontSize:40.0,color: Colors.white70),
                  ),
                ),
              ),
              new Padding(
                padding:const EdgeInsets.only(bottom:35.0),
              ),
              new Padding(
                padding: const EdgeInsets.only(top:30.0,left:30.0,right: 30.0),
                child: new MaterialButton(
                height: 40.0,
                minWidth: 140.0,
                color: Colors.green,
                textColor: Colors.white,
                child: new Text("GOOGLE İLE GİRİŞ"),
                onPressed: giris,
                splashColor: Colors.redAccent,
              ),
            ),
              new Padding(
                padding: const EdgeInsets.only(left:30.0,top:20.0,bottom:15.0),
                child: new RichText(
                  text: new TextSpan(
                    text: "Diğer Seçenekler",
                    style:  new TextStyle(fontWeight: FontWeight.w100,fontFamily:'Ubuntu',fontSize:15.0,color: Colors.white70),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(left:30.0,top:80.0),
                child: new RichText(
                  text: new TextSpan(
                    text: "İzmir Trafik Çevirme uygulamasında paylaşılan bilgileri tamami ile bilgi amaçlıdır. Herhangi bir resmiyeti yoktur. "
                        "Her üye paylaştığı gönderiler ile her türlü sorumluluğu üstlenmektedir.",
                    style:  new TextStyle(fontWeight: FontWeight.w200,fontFamily:'Ubuntu',fontSize:15.0,color: Colors.white70),
                  ),
                ),
              ),
             // new Image(
               // image: new AssetImage("assets/izmirde_cevirme_logo.png"),
                //fit: BoxFit.cover,
              //),

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
