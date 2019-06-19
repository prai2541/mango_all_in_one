import 'package:app_ui/projectionDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Projection extends StatelessWidget {
  String docnumber = "PJT-2019-7";
  String remark = "June 2019";

  List<String> projects = [
    "Project No.1",
    "Project No.2",
    "Project No.3",
    "Project No.4",
    "Project No.5",
  ];

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 1125.0;
    double defaultScreenHeight = 2436.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenUtil.instance.setHeight(520)),
            child: AppBar(
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Center(
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setHeight(300),
                          left: ScreenUtil.instance.setWidth(40),
                          right: ScreenUtil.instance.setWidth(40)),
                      child: Container(
                        padding:
                            EdgeInsets.all(ScreenUtil.instance.setHeight(40)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Text(
                                    'Doc. No. : $docnumber',
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(50),
                                    ),
                                  )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenUtil.instance
                                              .setHeight(10)),
                                      child: Text(
                                        'Remark : $remark',
                                        style: TextStyle(
                                          fontSize:
                                              ScreenUtil.instance.setSp(50),
                                        ),
                                      )),
                                ],
                              )
                            ]),
                      )),
                ),
              ),
              title: Text(
                'Projection',
                style: TextStyle(color: Colors.white),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white.withOpacity(0.75),
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  },
                )
              ],
            )),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, i) {
                  return Card(
                      child: ListTile(
                    contentPadding: EdgeInsets.only(right: 5),
                    leading: Container(
                      width: ScreenUtil.instance.setWidth(30),
                      color: Colors.blue,
                    ),
                    title: Text(projects[i],
                        style:
                            TextStyle(fontSize: ScreenUtil.instance.setSp(50))),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => new ProjectionDetail(
                                docnumber,
                                remark,
                                projects[i],
                              )));
                    },
                  ));
                }),
          )
        ]));
  }
}
