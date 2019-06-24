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
          title: Text('Normal Alert Detail', style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.home,
                  size: ScreenUtil.instance.setSp(30),
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
            margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10), top: ScreenUtil.instance.setHeight(20), bottom: ScreenUtil.instance.setHeight(10)),
            child: ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.red,),
              title:Text('$date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
              )
          ),
         
          Expanded(child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 3,
                margin: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20), right: ScreenUtil.instance.setWidth(20), top: ScreenUtil.instance.setHeight(10), bottom: ScreenUtil.instance.setHeight(10)),
                child: Container(
                    padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20), right: ScreenUtil.instance.setWidth(20), top: ScreenUtil.instance.setHeight(20), bottom: ScreenUtil.instance.setHeight(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Owner Rec.Out (Banks)',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.instance.setSp(15)),
                        ),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text('Due Date : ${data[i].duedate}', style: TextStyle(fontSize: ScreenUtil.instance.setSp(15)),),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text('Project : ${data[i].project}', style: TextStyle(fontSize: ScreenUtil.instance.setSp(15)),),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text('Credit Type : ${data[i].creditType}', style: TextStyle(fontSize: ScreenUtil.instance.setSp(15))),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text('Document: ${data[i].document}', style: TextStyle(fontSize: ScreenUtil.instance.setSp(15))),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text('BG/CH No. : ${data[i].bgch}', style: TextStyle(fontSize: ScreenUtil.instance.setSp(15))),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text('Credit Line : ${data[i].creditLine}', style: TextStyle(fontSize: ScreenUtil.instance.setSp(15))),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text(
                            'Bank / Branch: ${data[i].bank} / ${data[i].branch}', style: TextStyle(fontSize: ScreenUtil.instance.setSp(15))),
                        SizedBox(height: ScreenUtil.instance.setHeight(1.5),),
                        Text('Amount: '+ data[i].amount.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: TextStyle(fontSize: ScreenUtil.instance.setSp(15))),
                      ],
                    )),
              );
            },
          ))
        ]));
  }
}
