import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';

class HomeGridTile extends StatelessWidget {
  final String image;
  final String title;

  const HomeGridTile({Key key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Card(
        color: Colors.blue[200],
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(10.0),
              child: new Card(
                  margin: EdgeInsets.symmetric(vertical: 2.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Colors.white70, width: 1)),
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: new Center(
                      child: Image.asset(
                        this.image,
                        fit: BoxFit.fitHeight,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  )),
            ),
            Text(this.title,
                style: TextStyle(
                    fontSize: 11.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.black))
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
  ScrollController scrollController;
  bool scrollVisible = true;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      scrollVisible = value;
    });
  }

  BoomMenu buildBoomMenu() {
    return BoomMenu(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        marginBottom: -8.0,
        child: Icon(Icons.add),
        fabAlignment: Alignment.bottomRight,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        scrollVisible: scrollVisible,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        children: [
          MenuItem(
//          child: Icon(Icons.accessibility, color: Colors.black, size: 40,),
            child: IconButton(
              icon: Icon(Icons.person_add),
              onPressed: null,
              iconSize: 40,
            ),
            title: "Taagya",
            titleColor: Colors.grey[850],
            subtitle: "Apply as a taagya",
            subTitleColor: Colors.grey[850],
            backgroundColor: Colors.grey[50],
            onTap: () => print('Taagya'),
          ),
          MenuItem(
            child: IconButton(
              icon: Icon(Icons.video_call),
              onPressed: null,
              iconSize: 40,
            ),
            title: "Virtual meet",
            subtitle: "Schedule a virtual meet with a doctor",
            titleColor: Colors.black,
            subTitleColor: Colors.black,
            backgroundColor: Colors.white,
            onTap: () => print('Virtual meet'),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 0.75;
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
              new Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: new Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
                    child: new Column(
                      children: <Widget>[
                        new Center(
                          child: new Text('Search by specialist'),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: (itemWidth / itemHeight),
                              padding: EdgeInsets.all(4.0),
                              mainAxisSpacing: 4.0,
                              crossAxisSpacing: 4.0,
                              children: <Widget>[
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/ribbon.webp",
                                    title: "Gastroenterologist",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/tooth.webp",
                                    title: "Dentist",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/mask.webp",
                                    title: "General surgeon",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/mentalhealth.webp",
                                    title: "Phychiatrist",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/mother.webp",
                                    title: "Gynecologist",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/doctor.webp",
                                    title: "General physician",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/bone.webp",
                                    title: "Orthopedist",
                                  ),
                                ),
                                new GridTile(
                                  child: new HomeGridTile(
                                    image: "assets/icons/eyecare.webp",
                                    title: "Ent specialist",
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
                  margin: EdgeInsets.only(right: 60.0),
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
                      child: new Text("Looking for more ?",
                          style: TextStyle(fontSize: 20.0)),
                      onPressed: () => {},
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: buildBoomMenu(),
      ),
    );
  }
}
