import 'package:app_ui/po_lists.dart';
import 'package:app_ui/po_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class POTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'PO Receive',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              _customTab(Icons.camera_alt, 'Scan Barcode'),
              _customTab(Icons.list, 'PO Lists')
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            POQRCode(),
            POLists(),
          ],
        ),
      ),
    );
  }

  Tab _customTab(IconData icon, String title) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
