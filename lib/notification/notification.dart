import 'noti_normal.dart';
import 'noti_data.dart';
//import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff46B5A6),
            iconTheme: IconThemeData(color: Colors.white),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  })
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,

              // indicatorWeight: 3.0,
              // labelColor: Color(0xFFB8001C),
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Normal Alert",
                    style: TextStyle(fontSize: ScreenUtil.instance.setSp(16)),
                  ),
                ),
                Tab(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Expanded(
                          child: Text(
                        "Collateral Amount",
                        style:
                            TextStyle(fontSize: ScreenUtil.instance.setSp(16)),
                      )),
                      Expanded(
                          child: Text(
                        "Alert",
                        style:
                            TextStyle(fontSize: ScreenUtil.instance.setSp(16)),
                      ))
                    ]))
              ],
            ),
            title: Text('Notification', style: TextStyle(color: Colors.white)),
          ),
          body: TabBarView(
            children: <Widget>[NormalAlert(), CollateralAlert()],
          ),
        ),
      ),
    );
  }
}

class CollateralAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rawData.years.length,
      itemBuilder: (context, i) {
        return ExpansionTile(
          leading: Icon(Icons.list),
          title: Text('Collateral Amount Alert ${rawData.years[i].year}',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(16))),
          children: [
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: rawData.years[i].months.length,
                    itemBuilder: (context, j) {
                      if (rawData.years[i].months[j].days != null) {
                        return Card(
                            child: ExpansionTile(
                          leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: ScreenUtil.instance.setSp(22.5),
                                )
                              ]),
                          title: Text(
                              '${rawData.years[i].months[j].month} ${rawData.years[i].year}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16))),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: ScreenUtil.instance.setWidth(20),
                                  right: ScreenUtil.instance.setWidth(10),
                                  bottom: ScreenUtil.instance.setHeight(10)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    rawData.years[i].months[j].days.length,
                                itemBuilder: (context, k) {
                                  return Container(
                                      child: ListTile(
                                    title: Text(
                                        '${rawData.years[i].months[j].days[k].day}',
                                        style: TextStyle(
                                            fontSize:
                                                ScreenUtil.instance.setSp(16))),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: ScreenUtil.instance.setHeight(16),
                                    ),
                                    onTap: () {},
                                  ));
                                },
                              ),
                            )
                          ],
                        ));
                      } else {
                        return Card(
                          child: ListTile(
                            leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: ScreenUtil.instance.setSp(22.5),
                                  )
                                ]),
                            title: Text(
                                '${rawData.years[i].months[j].month} ${rawData.years[i].year}',
                                style: TextStyle(
                                    fontSize: ScreenUtil.instance.setSp(16))),
                          ),
                        );
                      }
                    }))
          ],
        );
      },
    );
  }
}
