import 'package:app_ui/po_history.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class POMain extends StatelessWidget {
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'PO Receive',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: POLists(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: ScreenUtil.instance.setHeight(20),
            right: ScreenUtil.instance.setWidth(10)),
        child: Container(
          // height: ScreenUtil.instance.setHeight(60),
          // width: ScreenUtil.instance.setWidth(60),
          child: FittedBox(
            child: FloatingActionButton(
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
    );
  }

  Future scan(BuildContext context) async {
    try {
      String barcode = await BarcodeScanner.scan();
      return Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => new PoHist(barcode)),
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

class POLists extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => POListsState();
}

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
                elevation: 4,
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
                  elevation: 2,
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
                                      fontSize: ScreenUtil.instance.setSp(16)),
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
            color: Colors.grey[600], fontSize: ScreenUtil.instance.setSp(13)));
  }
}
