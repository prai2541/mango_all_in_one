import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff46B5A6),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                },
              )
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Normal Alert",
                ),
                Tab(
                  text: "Collateral Amount Alert",)
              ], 
            ),
            title: Text('Notification'),
          ),
          body: TabBarView(
            children: <Widget>[
              NormalAlert(),
              CollateralAlert()
            ],
          ),
        ),
      )
    );
  }
}

class NormalAlert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NormalAlertState();
  }
}

class NormalAlertState extends State<NormalAlert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
    );
  }
}

class CollateralAlert extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CollateralAlertState();
  }
}

class CollateralAlertState extends State<CollateralAlert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
    );
  }

}