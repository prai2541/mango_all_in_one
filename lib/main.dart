import 'dart:ui';
import 'package:app_ui/approve_detail.dart';
import 'package:app_ui/matadd.dart';
import 'package:app_ui/po_tabs.dart';
import 'package:app_ui/po_history.dart';
import 'package:app_ui/po_list_info.dart';
import 'package:app_ui/po_new_entry.dart';
import 'package:app_ui/projection.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:badges/badges.dart';
import 'package:flutter/services.dart';
import 'approve.dart';
import 'dc_detail.dart';
import './notification.dart';
import 'signin.dart';
import 'package:flutter/cupertino.dart';
import 'dcsystem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'PRmain.dart';
import 'PRcon.dart';
import 'PRadd.dart';
import 'package:auto_size_text/auto_size_text.dart';

final List<String> imgList = [
  'assets/AR-Account-Receivable-System.JPG',
  'assets/BD-Bidding-System.JPG',
  'assets/FA-Fixed-Asset-System.JPG',
  'assets/IC-Inventory-Control-System.JPG'
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

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new SigninL());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (BuildContext context) => new MyApp(),
        '/signin': (BuildContext context) => new Signin(),
        '/dc-system/detail': (BuildContext context) => new DCDetail(),
        '/pr-main': (BuildContext context) => new PRmainL(),
        '/pr-main/con': (BuildContext context) => new PRcontinueL(),
        '/pr-add': (BuildContext context) => new PRAdd(),
        '/projection': (BuildContext context) => new Projection(),
        '/notification': (BuildContext context) => new NotificationPage(),
        '/dc-system': (BuildContext context) => new DCSys(),
        '/mat-add': (BuildContext context) => new MatAdd(),
        '/po': (context) => new POTabs()
        '/approve-detail' : (BuildContext context) => new ApproveDetail(),
        '/approve': (context) => new Approve(),
        '/po-hist' : (context) => new PoHist(),
        '/po-list-info' : (context) => new PoListInfo(),
        '/po-new-entry' : (context) => new NewPoEntry()
      },
      theme: ThemeData(primaryColor: Color(0xFF46B5A6), fontFamily: 'Prompt'),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePageRoute extends CupertinoPageRoute {
  HomePageRoute() : super(builder: (BuildContext context) => new MyHomePage());

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
    double defaultScreenWidth = 1440 / 3.5;
    double defaultScreenHeight = 2960 / 3.5;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Column(children: [
      Container(
          margin: EdgeInsets.only(
              bottom: ScreenUtil.instance.setHeight(10),
              top: ScreenUtil.instance.setHeight(10),
              left: ScreenUtil.instance.setWidth(30),
              right: ScreenUtil.instance.setWidth(30)),
          height: ScreenUtil.instance.setHeight(225),
          width: ScreenUtil.instance.setWidth(400),
          // decoration: BoxDecoration(
          //   border: Border.all(),
          //   borderRadius: BorderRadius.all(Radius.circular(10))
          // ),
          child: CarouselSlider(
              pauseAutoPlayOnTouch: Duration(seconds: 3),
              autoPlay: true,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(mediaContext).size.aspectRatio,
              items: imgList.map(
                (name) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        name,
                        fit: BoxFit.fill,
                        //width: ScreenUtil.instance.setWidth(800),
                        //height: ScreenUtil.instance.setHeight(150),
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
                      ? Color.fromRGBO(99, 178, 166, 0.9)
                      : Color.fromRGBO(99, 178, 166, 0.4)),
            );
          },
        ),
      ),
    ]);
  }

  Widget gridViewButton(String name, IconData icon, [Function onPressed]) {
    double defaultScreenWidth = 1440 / 3.5;
    double defaultScreenHeight = 2960 / 3.5;

    Color color = Theme.of(context).primaryColor;

    if (onPressed == null) {
      color = Colors.grey;
    }

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    if (i != 0) {
      return Badge(
        position: BadgePosition.topRight(
            top: ScreenUtil.instance.setHeight(-10),
            right: ScreenUtil.instance.setWidth(-5)),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.scale,
        padding: EdgeInsets.all(ScreenUtil.instance.setWidth(5)),
        badgeContent: Container(
            width: ScreenUtil.instance.setWidth(26),
            child: Center(
              child: AutoSizeText(
                '$i',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.instance.setSp(14)),
              ),
            )),
        child: Container(
            height: 300.0,
            //color: Colors.transparent,
            child: InkWell(
              borderRadius: new BorderRadius.all(
                  Radius.circular(ScreenUtil.instance.setSp(20.0))),
              onTap: onPressed,
              child: new Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: color, width: 2.5),
                      borderRadius: new BorderRadius.all(
                          Radius.circular(ScreenUtil.instance.setSp(20.0)))),
                  child: new Center(
                    child: Container(
                        alignment: Alignment(0.0, 0.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(icon,
                                  size: ScreenUtil.instance.setSp(45),
                                  color: color),
                              Text(
                                '$name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: color,
                                  fontSize: ScreenUtil.instance.setSp(14),
                                ),
                              )
                            ])),
                  )),
            )),
      );
    } else {
      return Container(
          height: 300.0,
          //color: Colors.transparent,
          child: InkWell(
            borderRadius: new BorderRadius.all(
                Radius.circular(ScreenUtil.instance.setSp(20.0))),
            onTap: onPressed,
            child: new Container(
                decoration: new BoxDecoration(
                    border: new Border.all(color: color, width: 2.5),
                    borderRadius: new BorderRadius.all(
                        Radius.circular(ScreenUtil.instance.setSp(20.0)))),
                child: new Center(
                  child: Container(
                      alignment: Alignment(0.0, 0.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon,
                                size: ScreenUtil.instance.setSp(45),
                                color: color),
                            Text(
                              '$name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: color,
                                fontSize: ScreenUtil.instance.setSp(14),
                              ),
                            )
                          ])),
                )),
          ));
    }
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 1440 / 3.5;
    double defaultScreenHeight = 2960 / 3.5;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Stack(children: <Widget>[
      // Wallpaper
      // Image.asset(
      //   "assets/bg_0004.jpg",
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   fit: BoxFit.cover,
      // ),
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.only(top: 10),
                // margin: EdgeInsets.only(bottom: 15),
                child: Column(children: <Widget>[
                  Center(
                      child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        'https://www.sbp-creative.com/wp-content/uploads/2017/01/profile-placeholder.png'),
                    backgroundColor: Colors.transparent,
                  )),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Profile 1',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ]),
                decoration: BoxDecoration(color: Color(0xFF46B5A6)),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xFF46B5A6),
                ),
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (Route<dynamic> route) => false);
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Color(0xFF46B5A6)),
                title: Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Color(0xFF46B5A6)),
                title: Text('Notification'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/notification');
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Color(0xFF46B5A6)),
                title: Text('About'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Color(0xFF46B5A6)),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/signin', (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            getFullScreenCarousel(context),
            //SizedBox(height: ScreenUtil.instance.setHeight(40)),
            Expanded(
                child: Center(
                    child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(32),
                  right: ScreenUtil.instance.setWidth(32),
                  top: ScreenUtil.instance.setHeight(15)),
              crossAxisSpacing: ScreenUtil.instance.setWidth(15),
              crossAxisCount: 3,
              mainAxisSpacing: ScreenUtil.instance.setWidth(15),
              children: <Widget>[
                gridViewButton("Approved", Icons.check, () {
                  Navigator.of(context).pushNamed('/approve');
                }),
                gridViewButton("Notifications", Icons.notifications, () {
                  Navigator.of(context).pushNamed('/notification');
                }),
                gridViewButton("Projection", Icons.lightbulb_outline, () {
                  Navigator.of(context).pushNamed('/projection');
                }),
                gridViewButton("Count Asset", Icons.monetization_on),
                gridViewButton("PO Receive", Icons.library_books, () {
                  Navigator.of(context).pushNamed('/po');
                }),
                gridViewButton("DC System", Icons.local_atm, () {
                  Navigator.of(context).pushNamed('/dc-system');
                }),
                gridViewButton("Management System", Icons.build),
                gridViewButton("Purchase Requisition", Icons.shopping_cart, () {
                  Navigator.of(context).pushNamed('/pr-main');
                }),
                gridViewButton("Application", Icons.apps),
                //SizedBox(height: ScreenUtil.instance.setHeight(10),)
              ],
            )))
          ],
        ),
      )
    ]);
  }
}
