import 'package:app_ui/ca/ca_report_checked.dart';
import 'package:badges/badges.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import 'ca_report_unchecked.dart';

class AssetReport extends StatelessWidget {
  var uncheckedCount = 3;
  var checkedCount = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                  '/home', (Route<dynamic> route) => false),
            )
          ],
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Asset Report',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: <Widget>[
              _customTab('CHECKED', Colors.green, checkedCount),
              _customTab('UNCHECKED', Colors.red, uncheckedCount)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CheckedReport(),
            UncheckedReport(),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: ScreenUtil.instance.setHeight(20),
              right: ScreenUtil.instance.setWidth(10)),
          child: Container(
            // height: ScreenUtil.instance.setHeight(60),
            // width: ScreenUtil.instance.setWidth(60),
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Color(0xFF46B5A6),
                onPressed: () => scan(context),
                child: Container(
                  child: Image.asset(
                    'assets/barcode.png',
                    width: ScreenUtil.instance.setWidth(30),
                  ),
                ),
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future scan(BuildContext context) async {
    try {
      String barcode = await BarcodeScanner.scan();
      return Navigator.of(context).pushNamed('/ca-asset-detail');
    } on PlatformException catch (e) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.code),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget _customTab(String label, Color color, var notiCount) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            child: Text(label),
            padding: EdgeInsets.only(right: ScreenUtil.instance.setWidth(10)),
          ),
          Badge(
            badgeContent: Text(
              notiCount.toString(),
              style: TextStyle(color: Colors.white),
            ),
            badgeColor: color,
            toAnimate: false,
          )
        ],
      ),
    );
  }
}
