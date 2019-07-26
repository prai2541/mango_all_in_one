import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'noti_data.dart';
import 'noti_normal_detail.dart';

class NormalAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rawData.years.length,
      itemBuilder: (context, i) {
        return ExpansionTile(
          leading: Icon(Icons.list),
          title: Text('Normal Amount Alert ${rawData.years[i].year}',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(16))),
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(15),
                    right: ScreenUtil.instance.setWidth(15),
                    bottom: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: rawData.years[i].months.length,
                    itemBuilder: (context, j) {
                      if (rawData.years[i].months[j].days != null) {
                        return ExpansionTile(
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
                                  left: ScreenUtil.instance.setWidth(30),
                                  right: ScreenUtil.instance.setWidth(10),
                                  bottom: ScreenUtil.instance.setHeight(10)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    rawData.years[i].months[j].days.length,
                                itemBuilder: (context, k) {
                                  return ListTile(
                                    title: Text(
                                        '${rawData.years[i].months[j].days[k].day}',
                                        style: TextStyle(
                                            fontSize:
                                                ScreenUtil.instance.setSp(16))),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      size: ScreenUtil.instance.setHeight(16),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  new NormalAlertDetail(
                                                      rawData.years[i].months[j]
                                                          .days[k].day,
                                                      rawData.years[i].months[j]
                                                          .days[k].datas)));
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      } else {
                        return ListTile(
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
                        );
                      }
                    }))
          ],
        );
      },
    );
  }
}
