import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';
import 'signin.dart';
import 'package:flutter/cupertino.dart';
import 'dcsystem.dart';
import './portalPopup.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

void main() => runApp(SigninL());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home' : (BuildContext context) => new MyApp(),
        '/signin' : (BuildContext context) => new Signin(),
        '/portal' : (BuildContext context) => new PortalPopup(),

      },
      theme: ThemeData(
        primaryColor: Color(0xFF46B5A6),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePageRoute extends CupertinoPageRoute {
  HomePageRoute()
      : super(builder: (BuildContext context) => new MyHomePage());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;

  Widget getFullScreenCarousel(BuildContext mediaContext) {
    return Column(children: [
      Container(
          height: 250,
          width: 1000.0,
          child: CarouselSlider(
              autoPlay: true,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
              items: imgList.map(
                (url) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  );
                },
              ).toList())),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }

  Badge gridViewButton(String name, IconData icon, Function onPressed) {
    return new Badge(
      position: BadgePosition.topRight(top: -10, right: -3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.scale,
      padding: EdgeInsets.all(7.5),
      badgeContent: Text(
        '$i',
        style: TextStyle(color: Colors.white, fontSize: 17.5),
      ),
      child: Container(
          height: 300.0,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
            onTap: onPressed,
            child: new Container(
                decoration: new BoxDecoration(
                    border: new Border.all(
                        color: Theme.of(context).primaryColor, width: 2.5),
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(30.0))),
                child: new Center(
                  child: Container(
                      alignment: Alignment(0.0, 0.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon,
                                size: 45,
                                color: Theme.of(context).primaryColor),
                            Text(
                              '$name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ])),
                )),
          )),
    );
  }

  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/bg_0004.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.apps,
                  color: Colors.white.withOpacity(0.75),
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/portal');
                    // PageRouteBuilder(
                    // transitionDuration: Duration(milliseconds: 150),
                    // opaque: false,
                    // pageBuilder: (BuildContext context, _, __) => PortalPopup(),
                    // transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                    //   return new FadeTransition(
                    //       opacity: animation, 
                    //       child: child);
                    // }));
                },
              )
            ],
          ),
          body: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              getFullScreenCarousel(context),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(25.0),
                crossAxisSpacing: 20,
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                children: <Widget>[
                  gridViewButton("Approved", Icons.check, () {
                    setState(() {
                      this.i++;
                    });
                  }),
                  gridViewButton("Notifications", Icons.notifications, () {
                    setState(() {
                      this.i++;
                    });
                  }),
                  gridViewButton("Projection", Icons.lightbulb_outline, () {
                    setState(() {
                      this.i++;
                    });
                  }),
                  gridViewButton("Count Asset", Icons.monetization_on, () {
                    setState(() {
                      this.i++;
                    });
                  }),
                  gridViewButton("PO Receive", Icons.library_books, () {
                    setState(() {
                      this.i++;
                    });
                  }),
                  gridViewButton("DC System", Icons.local_atm, () {
                    Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context, Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return DCSys();
                            },
                            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                    begin: Offset(1.0, 0.0),
                                    end: Offset(0.0, 0.0),
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                            transitionDuration: Duration(milliseconds: 300)));
                  }),
                  gridViewButton("Management System", Icons.build, () {
                    setState(() {
                      this.i++;
                    });
                  }),
                  gridViewButton("Purchase Requisition", Icons.shopping_cart,
                      () {
                    setState(() {
                      this.i++;
                    });
                  }),
                  gridViewButton("Application", Icons.apps, () {
                    setState(() {
                      this.i++;
                    });
                  }),
                ],
              )
            ],
          ))
    ]);
  }
}
