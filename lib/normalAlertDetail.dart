import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'notification.dart';

class NormalAlertDetail extends StatelessWidget {
  List<Datas> data;
  String date;

  NormalAlertDetail(this.date, this.data);

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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Normal Alert Detail',
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.home,
                  size: ScreenUtil.instance.setSp(25),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (Route<dynamic> route) => false);
                })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text('$date')
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 16,
              color: Colors.black,
            ),
          ),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Card(
                margin: EdgeInsets.all(10),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Owner Rec.Out (Banks)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Due Date : ${data[i].duedate}'),
                        Text('Project : ${data[i].project}'),
                        Text('Credit Type : ${data[i].creditType}'),
                        Text('Document: ${data[i].document}'),
                        Text('BG/CH No. : ${data[i].bgch}'),
                        Text('Credit Line : ${data[i].creditLine}'),
                        Text(
                            'Bank / Branch: ${data[i].bank} / ${data[i].branch}'),
                        Text('Amount: ${data[i].amount}'),
                      ],
                    )),
              );
            },
          )
        ]));
  }
}
