import 'dart:io';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class AssetDetail extends StatelessWidget {
  Future scan(BuildContext context) async {
    try {
      // String barcode = await BarcodeScanner.scan();
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

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Detail',
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
      body: AssetDetails(),
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
      // bottomNavigationBar: Container(
      //     margin: EdgeInsets.only(
      //         left: ScreenUtil.instance.setWidth(20),
      //         right: ScreenUtil.instance.setWidth(20),
      //         top: ScreenUtil.instance.setHeight(10),
      //         bottom: ScreenUtil.instance.setHeight(10)),
      //     child: Row(
      //       children: <Widget>[
      //         Expanded(
      //           flex: 1,
      //           child: RaisedButton(
      //             color: Colors.red,
      //             child: Text(
      //               'Cancel',
      //               style: TextStyle(
      //                   fontSize: ScreenUtil.instance.setSp(16), color: Colors.white),
      //             ),
      //             onPressed: () {
      //               // Navigator.of(context).pushNamed('/po-new-entry',
      //               //     arguments: ScreenArguments('P01234567890'));
      //               Navigator.of(context).pop();
      //             },
      //           ),
      //         ),
      //         Expanded(
      //           flex: 1,
      //           child: RaisedButton(
      //             color: Color(0xFF00b89c),
      //             child: Text(
      //               'Save',
      //               style: TextStyle(
      //                   fontSize: ScreenUtil.instance.setSp(16), color: Colors.white),
      //             ),
      //             onPressed: () {
      //               // Navigator.of(context).pushNamed('/po-new-entry',
      //               //     arguments: ScreenArguments('P01234567890'));
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   )
    );
  }
}

class AssetDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AssetDetailState();
  }
}

class AssetDetailState extends State<AssetDetails> {
  TextEditingController codectrl = new TextEditingController();
  String codetext = '';
  bool code = !true;
  TextEditingController namectrl = new TextEditingController();
  String nametext = '';
  bool name = !true;
  TextEditingController serialctrl = new TextEditingController();
  String serialtext = '';
  bool serial = !true;
  TextEditingController qtyctrl = new TextEditingController();
  String qtytext = '';
  bool qty = !true;
  TextEditingController prjctrl = new TextEditingController();
  String prjtext = '';
  bool prj = !true;

  TextEditingController unamectrl = new TextEditingController();
  String unametext = '';
  bool uname = !true;
  TextEditingController remarkctrl = new TextEditingController();
  String remarktext = '';
  bool remark = !true;

  List<File> imglist = [];
  File img;

  Widget imgContainer() {
    if (img != null) {
      return Image.file(img);
    } else {
      return Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil.instance.setHeight(20)),
          Icon(Icons.photo_camera, size: ScreenUtil.instance.setSp(60)),
          Text('NO IMAGE',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(40)))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                  height: ScreenUtil.instance.setHeight(200),
                  child: imgContainer()),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[300],
                child: Row(
                  children: <Widget>[
                    Icon(Icons.format_list_bulleted),
                    Text(' Project :  Project Name')
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    textfield(Icons.insert_drive_file, ' Asset Code',
                        '$codetext', codectrl, code),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(
                        Icons.apps, " Asset Name", nametext, namectrl, name),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.menu, " Serial Number", serialtext,
                        serialctrl, serial),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.format_align_left, " Project", prjtext,
                        prjctrl, prj),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.format_align_left, " Quantity", qtytext,
                        qtyctrl, qty),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.format_align_left, " Unit Name", unametext,
                        unamectrl, uname),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.bookmark_border, " Asset Remark",
                        remarktext, remarkctrl, remark),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget textfield(icon, text, hinttext, controller, enabled) {
    if (hinttext == '') {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(icon),
              Text('$text'),
            ],
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(5),
          ),
          TextFormField(
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: text,
              // border: OutlineInputBorder(
              //   //gapPadding: 0,
              //   borderRadius: BorderRadius.all(Radius.circular(5)),
              //   borderSide: BorderSide(color: Colors.black)
              // ),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(icon),
              Text('$text'),
            ],
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(5),
          ),
          TextFormField(
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: hinttext,
              // border: OutlineInputBorder(
              //   //gapPadding: 0,
              //   borderRadius: BorderRadius.all(Radius.circular(5)),
              //   borderSide: BorderSide(color: Colors.black)
              // ),
            ),
          )
        ],
      );
    }
  }
}
