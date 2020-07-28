import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  AppointmentPage({Key key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Appointments',
          softWrap: true,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal),
        ),
      ),
      body: new Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.blue[100],
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Card(
                              child: new Padding(
                                padding: EdgeInsets.all(4.0),
                                child: new Center(
                                  child:
                                      Image.asset("assets/icons/doctor.webp"),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: new Center(
                              child: new Text('Date and time'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: new Container(
                      child: new Column(
                        children: [new Text("lorem ipsum")],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
