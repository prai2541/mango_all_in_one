import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class POLists extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => POListsState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class POListsState extends State<POLists> {
  String status = 'คงค้าง';

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
            height: ScreenUtil.instance.setHeight(60),
            child: Card(
                elevation: 3,
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(10)),
                        child: Text(
                          'สถานะรับของ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.instance.setSp(15)),
                        ),
                      ),
                      PopupMenuButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              status,
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(15)),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        onSelected: (result) {
                          setState(() {
                            status = result;
                          });
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value: 'เรียบร้อยแล้ว',
                                child: Text('เรียบร้อยแล้ว'),
                              ),
                              const PopupMenuItem(
                                value: 'คงค้าง',
                                child: Text('คงค้าง'),
                              ),
                              const PopupMenuItem(
                                value: 'ทั้งหมด',
                                child: Text('ทั้งหมด'),
                              ),
                            ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return Card(
                  elevation: 3,
                  margin: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(10),
                      right: ScreenUtil.instance.setWidth(10),
                      top: ScreenUtil.instance.setHeight(5)),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/po-hist'),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil.instance.setWidth(15)),
                          color: Colors.red[900],
                          height: ScreenUtil.instance.setHeight(80),
                          width: ScreenUtil.instance.setWidth(4),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(
                                ScreenUtil.instance.setWidth(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'PO2019070003',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[900],
                                      fontSize: ScreenUtil.instance.setSp(15)),
                                ),
                                _subtiltle('Project : Mango1'),
                                _subtiltle('Vendor : Company1'),
                                _subtiltle('Add By : MANGO'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }

  Text _subtiltle(String sub) {
    return Text(sub,
        style: TextStyle(
            color: Colors.grey[600], fontSize: ScreenUtil.instance.setSp(12)));
  }
}
