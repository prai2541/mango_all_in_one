import '../model/assetLists.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'asset.dart';

class AssetList extends StatelessWidget {
  List<Asset> assetlist = [
    Asset(null, 'A.0001', 'อาคาร'),
    Asset(null, 'A.0002', 'เก้าอี้'),
    Asset(null, 'A.0003', 'โต๊ะ'),
    Asset(null, 'A.0004', 'projector')
  ];

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset List',
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
                itemCount: assetlist.length,
                itemBuilder: (context, index) {
                  if (assetlist[index].img == null) {
                    return InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        onTap: () {
                          AssetLists asset = AssetLists(
                              assetlist[index].no, assetlist[index].name);
                          Navigator.pop(context, asset);
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
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(Icons.photo_camera),
                                            Column(
                                              children: <Widget>[
                                                Text('No Image'),
                                                Text('Available')
                                              ],
                                            ),
                                          ],
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Asset No. :  ${assetlist[index].no} ',
                                            style: TextStyle(
                                                fontSize: ScreenUtil.instance
                                                    .setSp(16)),
                                          ),
                                          SizedBox(
                                              height: ScreenUtil.instance
                                                  .setHeight(10)),
                                          Text(
                                            'Asset Name :  ${assetlist[index].name}',
                                            style: TextStyle(
                                                fontSize: ScreenUtil.instance
                                                    .setSp(16)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))));
                  } else {
                    return InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        onTap: () {
                          AssetLists asset = AssetLists(
                              assetlist[index].no, assetlist[index].name);
                          Navigator.pop(context, asset);
                        },
                        child: Card(
                            margin: EdgeInsets.all(5),
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Image.file(
                                        assetlist[index].img,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            'Asset No. :  ${assetlist[index].no} ',
                                            maxLines: 1,
                                            stepGranularity: 1,
                                            style: TextStyle(
                                                fontSize: ScreenUtil.instance
                                                    .setSp(16)),
                                          ),
                                          SizedBox(
                                              height: ScreenUtil.instance
                                                  .setHeight(10)),
                                          AutoSizeText(
                                            'Asset Name :  ${assetlist[index].name}',
                                            maxLines: 1,
                                            stepGranularity: 1,
                                            style: TextStyle(
                                                fontSize: ScreenUtil.instance
                                                    .setSp(16)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))));
                  }
                },
              ))
            ],
          )),
    );
  }
}
