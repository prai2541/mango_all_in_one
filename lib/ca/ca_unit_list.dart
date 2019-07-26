import 'package:app_ui/model/unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnitList extends StatelessWidget {
  List<Unit> unitlist = [
    Unit('001', 'bottle'),
    Unit('002', 'piece'),
    Unit('003', 'set'),
    Unit('004', 'meter'),
    Unit('005', 'kilogram')
  ];

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit List',
            style: TextStyle(fontFamily: 'Prompt', color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(20),
            right: ScreenUtil.instance.setWidth(20),
            top: ScreenUtil.instance.setHeight(10),
            bottom: ScreenUtil.instance.setHeight(10)),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(16),
                      color: Colors.white),
                ),
                onPressed: () {
                  // Navigator.of(context).pushNamed('/po-new-entry',
                  //     arguments: ScreenArguments('P01234567890'));
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(30),
              right: ScreenUtil.instance.setWidth(30),
              top: ScreenUtil.instance.setHeight(20)),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'รายการทั้งหมด',
                    style: TextStyle(fontSize: ScreenUtil.instance.setSp(16)),
                  ),
                  // InkWell(
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  //   onTap: () {
                  //     // if(customizable) {
                  //     //   // only do shit if customizable is false
                  //     // }
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: Color(0xFF00b89c))
                  //     ),
                  //     child: Row(
                  //       children: <Widget>[
                  //         Text('Continue ', style: TextStyle(color: Color(0xFF00b89c), fontSize: ScreenUtil.instance.setSp(16))),
                  //         Icon(Icons.playlist_add, color: Color(0xFF00b89c),),
                  //         SizedBox(width: 10,)
                  //       ],
                  //     ),
                  //   )
                  // )
                ],
              ),
              SizedBox(height: ScreenUtil.instance.setHeight(15)),
              Flexible(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: unitlist.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            onTap: () {
                              Navigator.pop(context, unitlist[index].name);
                            },
                            child: Card(
                                margin: EdgeInsets.all(5),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 0, right: 0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text(
                                                    '${unitlist[index].no}'))),
                                        Expanded(
                                            flex: 3,
                                            child: Text(
                                                '${unitlist[index].name}')),
                                      ],
                                    ))));
                      }))
            ],
          )),
    );
  }
}
