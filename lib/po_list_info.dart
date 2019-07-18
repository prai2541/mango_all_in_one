import 'package:app_ui/po_detailed_info.dart';
import 'package:app_ui/po_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenArguments {
  String title;
  ScreenArguments(this.title);
}

class PoListInfo extends StatelessWidget {
  //String title;
  //PoListInfo(this.title);
  PoDetailedINfo help = PoDetailedINfo(
      'JIB company ltd.',
      '20190700007',
      '09/07/2019',
      '30',
      '08/08/2019',
      'BAHT',
      '1.00',
      'IV2345',
      '09/07/2019',
      '',
      '',
      '',
      true,
      false,
      false,
      true,
      'help', [
    MatInfo(
        'P6101250150301',
        'Gigabyte Aorus AD27QD QHD IPS Gaming Monitor 1ms 144Hz',
        '10.00',
        '4.00',
        '6.00'),
    MatInfo(
        'P6101250150302',
        'Gigabyte Aorus AD27QD QHD IPS Gaming Monitor 1ms 144Hz',
        '10.00',
        '4.00',
        '6.00')
  ]);

  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${args.title}',
            style: TextStyle(fontFamily: 'Prompt', color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          image('assets/AR-Account-Receivable-System.JPG'),
          Card(
              margin: EdgeInsets.all(5),
              child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('รายละเอียด',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(20)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Vendor :  ${help.vendor}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Rec No :  ${help.rec}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Rec Date :  ${help.recdate}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Term :  ${help.term}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Due Date :  ${help.due}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Currency :  ${help.currency}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Exchange Rate :  ${help.exrate}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Tax No :  ${help.taxno}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Tax Date :  ${help.taxdate}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Do No :  ${help.dono}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(3)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Color(0xFF00b89c),
                            radius: 4,
                          ),
                          Text(' Do Date :  ${help.dodate}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16)))
                        ],
                      ),
                    ],
                  ))),
          Card(
              margin: EdgeInsets.all(5),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Location',
                        style:
                            TextStyle(fontSize: ScreenUtil.instance.setSp(20))),
                    SizedBox(height: ScreenUtil.instance.setHeight(5)),
                    location(help.location)
                  ],
                ),
              )),
          Card(
              margin: EdgeInsets.all(5),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Quality',
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(20))),
                      ],
                    ),
                    SizedBox(height: ScreenUtil.instance.setHeight(10)),
                    Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          radio(' Comply', help.comply),
                          radio(' Complete', help.complete),
                        ]),
                    SizedBox(height: ScreenUtil.instance.setHeight(10)),
                    Row(
                      children: <Widget>[
                        Text('Service',
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(20))),
                      ],
                    ),
                    SizedBox(height: ScreenUtil.instance.setHeight(10)),
                    Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          radio(' On time', help.ontime),
                          radio(' Satisfaction', help.excellent),
                        ])
                  ],
                ),
              )),
          Card(
              margin: EdgeInsets.all(5),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Remark',
                        style:
                            TextStyle(fontSize: ScreenUtil.instance.setSp(20))),
                    SizedBox(height: ScreenUtil.instance.setHeight(5)),
                    remark(help.remark)
                  ],
                ),
              )),
          Card(
              // color: Color(0xFF00b89c),
              margin: EdgeInsets.all(5),
              child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('รายการที่รับของในครั้งนี้',
                        style:
                            TextStyle(fontSize: ScreenUtil.instance.setSp(20))),
                    SizedBox(height: ScreenUtil.instance.setHeight(3)),
                    matlist()
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget image(String route) {
    if (route != '') {
      return Container(
          height: ScreenUtil.instance.setHeight(250),
          child: Image.asset(
            route,
            fit: BoxFit.fill,
          ));
    } else {
      return Container(
          height: ScreenUtil.instance.setHeight(250),
          child: Text('NO IMG AVAILABLE'));
    }
  }

  Widget location(String location) {
    if (location == '') {
      return Text('ไม่พบตำแหน่งที่ตั้ง');
    } else {
      return Text('$location');
    }
  }

  Widget remark(String remark) {
    if (remark == '') {
      return Text('ไม่พบหมายเหตุ');
    } else {
      return Text('$remark');
    }
  }

  Widget radio(String title, bool value) {
    if (value) {
      return Expanded(
        flex: 2,
        child: Row(children: <Widget>[
          CircleAvatar(
            backgroundColor: Color(0xFF00b89c),
            radius: 4,
          ),
          Text('$title',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(16)))
        ]),
      );
    } else {
      return Expanded(
        flex: 2,
        child: Row(children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 4,
          ),
          Text('$title',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(16)))
        ]),
      );
    }
  }

  Widget matlist() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: help.list.length,
      itemBuilder: (context, index) {
        return Card(
            margin: EdgeInsets.all(5),
            child: Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('${index + 1}.  ${help.list[index].no}',
                          style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(15))),
                      SizedBox(height: ScreenUtil.instance.setHeight(5)),
                      Text('${help.list[index].name}',
                          style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(15))),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('PO. QTY : ${help.list[index].poqty}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(15))),
                          Text('Rec. QTY : ${help.list[index].recqty}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(15)))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Bal. QTY : ${help.list[index].balqty}',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(15),
                                  color: Colors.red))
                        ],
                      )
                    ])));
      },
    );
  }
}
