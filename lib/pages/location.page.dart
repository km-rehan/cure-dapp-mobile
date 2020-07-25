import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  Location({Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController controller = new TextEditingController();

  _onSearchChanged(String text) {
    controller.clear();
    print(text);
  }

  _onSearchCancelled() {
    controller.clear();
    _onSearchChanged('');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      final text = controller.text;
      controller.value = controller.value.copyWith(
          text: text,
          selection: TextSelection(
              baseOffset: text.length, extentOffset: text.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: new Text(
          'Doctor\'s appointment',
        ),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                      hintText: 'Search Location',
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: new IconButton(
                      icon: new Icon(Icons.cancel),
                      onPressed: _onSearchCancelled),
                ),
              ),
            ),
          ),
          //Expanded(),
          Expanded(
            child: new Align(
                alignment: Alignment.bottomCenter,
                child: new Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ButtonTheme(
                    minWidth: 380,
                    height: 60,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child:
                          new Text("Proceed", style: TextStyle(fontSize: 20.0)),
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
