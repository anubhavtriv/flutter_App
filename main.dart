import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyApp(),
    ),
  );
  FlutterStatusbarcolor.setStatusBarColor(Colors.amber);
}
  String cmd;
  var r;
  var url;
  var response;


class MyApp extends StatefulWidget {
  

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cmd;
  var r;
  void myweb(i) async {
  url = "http://192.168.29.26/cgi-bin/web.py?q=$i";
  response = await http.get(url);
  setState(() {
      r = response.body;
  });
  
}
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Welcome to Docker Commands!',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black45),
      ),
      seconds: 3,
      navigateAfterSeconds: AfterSplash(),
      image: new Image.asset('images/docker.gif'),
      backgroundColor: Colors.lightBlue.shade50,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 160.0,
      loaderColor: Colors.black38,
    );
  }
}


class AfterSplash extends StatefulWidget {
  AfterSplash({Key key}) : super(key: key);

  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  String cmd;
  var r;
  void myweb(i) async {
  url = "http://192.168.29.26/cgi-bin/web.py?q=$i";
  response = await http.get(url);
  setState(() {
      r = response.body;
  });
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow.shade400,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/best.png"),
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      "Docker at your service : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      cmd = value;
                    },
                    textAlign: TextAlign.left,
                    autocorrect: false,
                    autofocus: false,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.comment),
                      hintText: 'Docker Commands',
                    ),
                  ),
                  FlatButton(
                    color: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      myweb(cmd);
                    },
                    child: Text("RUN"),
                    textColor: Colors.black38,
                  ),
                  Text(r ?? "Output will display here",style:TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),),
                ])
          ],
        ),
      ),
    );
  }

  
}
