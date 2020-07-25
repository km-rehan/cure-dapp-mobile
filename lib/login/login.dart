import "package:flutter/material.dart";

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.blueAccent,
        child: Center(
          child: RaisedButton(
            onPressed: () => {
              print("Raised button Click")
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                color: Colors.redAccent[400],
              )),
            textColor: Colors.white,
            child: new Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.deepOrange]),
              ),
              padding: EdgeInsets.all(10.0),
              child: new Text(
                'Connect to wallet',
                style: new TextStyle(fontSize: 16.0),
              ),
            ),
        )),
      ),
    );
  }
}
