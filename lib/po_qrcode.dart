import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:barcode_scan/barcode_scan.dart';

class POQRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: ScreenUtil.instance.setHeight(400),
        child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/barcode.png',
                alignment: Alignment.topCenter,
                width: ScreenUtil.instance.width - 120,
              ),
              Container(
                width: ScreenUtil.instance.width,
                margin: EdgeInsets.only(
                    left: ScreenUtil.instance.setWidth(20),
                    right: ScreenUtil.instance.setWidth(20)),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Scan Barcode',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    scan(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future scan(BuildContext context) async {
    try {
      String barcode = await BarcodeScanner.scan();
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Result'),
            content: Text(barcode),
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
}
