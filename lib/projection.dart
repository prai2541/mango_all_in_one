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
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenUtil.instance.setHeight(180)),
            child: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(100),
                      left: ScreenUtil.instance.setWidth(15),
                      right: ScreenUtil.instance.setWidth(15)),
                  child: Container(
                      padding:
                          EdgeInsets.all(ScreenUtil.instance.setHeight(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              child: Text(
                            'Doc. No. : $docnumber',
                            style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(16),
                            ),
                          )),
                          Container(
                              // margin: EdgeInsets.only(
                              //     top: ScreenUtil.instance
                              //         .setHeight(1)),
                              child: Text(
                            'Remark : $remark',
                            style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(16),
                            ),
                          )),
                        ],
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
                    color: Colors.white,
                    size: ScreenUtil.instance.setSp(30),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(
                            right: ScreenUtil.instance.setWidth(10)),
                        leading: Container(
                          width: ScreenUtil.instance.setWidth(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: Colors.blue,
                          ),
                        ),
                        title: Text(projects[i],
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(16))),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenUtil.instance.setSp(18),
                        ),
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
