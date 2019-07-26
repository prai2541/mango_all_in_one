import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final SlidableController slidableController = SlidableController();

class ApproveUpper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10)),
      child: ListView(
        children: <Widget>[
          customList('PRM20190708', '157,875', '', 'none'),
          Divider(height: 0),
          customList('PRM20190708', '157,875', '', 'none'),
          Divider(height: 0),
          customList('PRM20190708', '157,875', '', 'none'),
          Divider(height: 0),
        ],
      ),
    );
  }

  Widget customList(String title, String amount, String remark, String status) {
    return ListTile(
      title: Text(title),
      subtitle: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Amount : $amount',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
            ),
            Text(
              'Remark : $remark',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
            ),
            Text(
              'Status : $status',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
            )
          ],
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Date : 14/08/19',
            style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
          ),
          Expanded(
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF46B5A6)),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(5),
                  right: ScreenUtil.instance.setWidth(5)),
              margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'File',
                    style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xFF46B5A6),
                    child: Text('1',
                        style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(10),
                            color: Colors.white)),
                    radius: ScreenUtil.instance.setSp(8),
                  ),
                  Icon(
                    Icons.folder,
                    size: ScreenUtil.instance.setSp(15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
