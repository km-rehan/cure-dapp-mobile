import 'package:curedapp/components/home.component.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            child: Icon(Icons.menu),
            onTap: () {
              if (_scaffoldKey.currentState.isDrawerOpen) {
                _scaffoldKey.currentState.openEndDrawer();
              } else {
                _scaffoldKey.currentState.openDrawer();
              }
            },
          ),
          actions: <Widget>[
            new Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                    '100 ES',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ))
          ],
        ),
        body: Scaffold(
          key: _scaffoldKey,
          body: Home(),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Text('Profile',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Text('Appointments',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Text('Medical Records',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Text('My doctors',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Text('Logout',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                // ListTile(
                //   title: new Text('Appointments'),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ListTile(
                //   title: new Text('Medical Records'),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ListTile(
                //   title: new Text('My doctors'),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ListTile(
                //   title: new Text('Logout'),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // )
              ],
            ),
          ),
        ));
  }
}
