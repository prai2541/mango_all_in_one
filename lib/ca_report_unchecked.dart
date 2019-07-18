import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UncheckedReport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UncheckedReportState();
  }
}

class UncheckedReportState extends State<UncheckedReport> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _customTile('B.0001', 'กล้องวงจรปิด'),
        _customTile('B.0002', 'กล้องวงจรปิด'),
        _customTile('B.0003', 'กล้องวงจรปิด'),
      ],
    );
  }

  Widget _customTile(String id, String title) {
    return Slidable(
      controller: SlidableController(),
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        Card(
          child: IconSlideAction(
            icon: Icons.check,
            caption: 'Checked',
            color: Colors.green,
          ),
        )
      ],
      child: Card(
        child: Container(
          padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10)),
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () =>
                    Navigator.of(context).pushNamed('/ca-asset-detail'),
                leading: Container(
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png'),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Chip(
                      padding: EdgeInsets.zero,
                      label: Text(id),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: Color(0xFF46B5A6),
                    ),
                    Text(title)
                  ],
                ),
                trailing: Badge(
                  toAnimate: false,
                  badgeColor: Color(0xFF46B5A6),
                  badgeContent: Text(
                    '0',
                    style: TextStyle(color: Colors.white),
                  ),
                  position: BadgePosition.topRight(
                      top: ScreenUtil.instance.setHeight(-2),
                      right: ScreenUtil.instance.setWidth(-2)),
                  child: IconButton(
                    icon: Icon(Icons.photo_library),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
