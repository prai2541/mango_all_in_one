import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    double defaultScreenWidth = 1440.0;
    double defaultScreenHeight = 2960.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);

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
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: ScreenUtil.instance.setSp(100),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                  }
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

class NormalAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, i) {
        return ExpansionTile(
          leading: Icon(Icons.list),
          title: Text("Normal Amount Alert ${2019-i}"),
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('January ${2019-i}'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('February ${2019-i}'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('March ${2019-i}'),
            ),
          ],
          );
      },
    );
  }
}

class CollateralAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
    );
  }

}