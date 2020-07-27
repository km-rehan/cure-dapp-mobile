import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

Future<bool> checkPermissions() async {
  bool isContactPermissionGranted = await Permission.contacts.isGranted;
  bool isLocationPermissionGranted = await Permission.location.isGranted;
  bool isStoragePermissionGranted = await Permission.storage.isGranted;

  if (!isContactPermissionGranted) await Permission.contacts.request();

  if (!isLocationPermissionGranted) await Permission.location.request();

  if (!isStoragePermissionGranted) await Permission.storage.request();

  return isContactPermissionGranted &&
      isLocationPermissionGranted &&
      isStoragePermissionGranted;
}

class _SplashState extends State<Splash> {
  bool _isShowingFirstWidget = true;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    checkPermissions()
        .then((granted) => {
              _timer = new Timer(Duration(seconds: 3), () {
                setState(() {
                  _isShowingFirstWidget = false;
                });
              })
            })
        .catchError((error) => {print(error)});
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  handleConnectWalletClick() {
    Navigator.pushReplacementNamed(context, '/location');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: new Container(
          decoration: new BoxDecoration(
              gradient:
                  new LinearGradient(colors: [Colors.blue, Colors.blueAccent])),
          child: AnimatedCrossFade(
              firstChild: new Center(
                child: Image.asset("assets/images/logo.png",
                    width: 400, height: 175),
              ),
              secondChild: new Center(
                  child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Image.asset("assets/images/logo.png",
                        width: 400, height: 175),
                  ),
                  ButtonTheme(
                    minWidth: 200,
                    height: 40,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.red)),
                      color: Colors.red,
                      textColor: Colors.white,
                      child: new Text("Connect to wallet",
                          style: TextStyle(fontSize: 14.0)),
                      onPressed: handleConnectWalletClick,
                    ),
                  )
                ],
              )),
              crossFadeState: _isShowingFirstWidget
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 1000))),
    );
  }
}

/*Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      Image(
        image: new AssetImage('assets/homebg.png'),
      ),
      Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
              onPressed: () => launch("tel://21213123123"),
              child: new Text("Call me")
          )
      ),
    ]
);*/
