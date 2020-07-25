import 'package:flutter/material.dart';

class HomeGridTile extends StatelessWidget {
  final String image;
  final String title;

  const HomeGridTile({Key key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 60,
      child: Card(
        color: Colors.blue[200],
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(15.0),
              child: new Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.white70, width: 1)),
                  child: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: new Center(
                      child: Image.asset(
                        this.image,
                        fit: BoxFit.fitHeight,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  )),
            ),
            new Center(
              child: Text(this.title,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.all(8.0),
                    child: new Text(
                      'Find and book',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Text(
                      'Mumbai',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueAccent[200],
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: new Align(
                  alignment: Alignment.center,
                  child: new Padding(
                    padding: EdgeInsets.only(top: 100.0, bottom: 30.0),
                    child: new Column(
                      children: <Widget>[
                        new Center(
                          child: new Text('Search by specialist'),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              padding: EdgeInsets.all(4.0),
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                              children: <Widget>[
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/ribbon.webp",
                                    title: "category",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/tooth.webp",
                                    title: "category",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/mask.webp",
                                    title: "category",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/mentalhealth.webp",
                                    title: "category",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/mother.webp",
                                    title: "category",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/doctor.webp",
                                    title: "category",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/bone.webp",
                                    title: "category",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/eyecare.webp",
                                    title: "category",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60.0,
                child: Container(
                  height: 60.0,
                  alignment: Alignment.bottomCenter,
                  child: SizedBox.expand(
                      child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child:
                          new Text("Proceed", style: TextStyle(fontSize: 20.0)),
                      onPressed: () => {},
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
