import 'po_info.dart';
import 'po_list_info.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PoHist extends StatelessWidget {
  final String title;

  PoHist([this.title = 'PO201907003']);

  var data = [
    PoInfo('Rec No. 001', 'What am i doing', 'Mango', 'Kaji Yuki', '05/01/2019',
        'RC'),
    PoInfo('Rec No. 001', 'What am i doing', 'Mango', 'Kaji Yuki', '05/01/2019',
        'RC'),
    PoInfo('Rec No. 001', 'What am i doing', 'Mango', 'Kaji Yuki', '05/01/2019',
        'RC'),
    PoInfo('Rec No. 001', 'What am i doing', 'Mango', 'Kaji Yuki', '05/01/2019',
        'RC'),
    PoInfo('Rec No. 001', 'What am i doing', 'Mango', 'Kaji Yuki', '05/01/2019',
        'RC')
  ];

  Widget poList() {
    return Container(
        padding: EdgeInsets.only(
            left: ScreenUtil.instance.setWidth(10),
            right: ScreenUtil.instance.setWidth(10)),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                onTap: () {
                  Navigator.of(context).pushNamed('/po-list-info',
                      arguments: ScreenArguments('${data[index].rec}'));
                },
                child: Card(
                    margin: EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'ครั้งที่ ${index + 1} : ${data[index].rec}',
                                style: TextStyle(
                                    fontSize: ScreenUtil.instance.setSp(18)),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.home, color: Color(0xFF00b89c)),
                              Text(' Project :  ${data[index].prj}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(15)))
                            ],
                          ),
                          SizedBox(height: ScreenUtil.instance.setHeight(2)),
                          Row(
                            children: <Widget>[
                              Icon(Icons.people, color: Color(0xFF00b89c)),
                              Text(' Vendor :  ${data[index].vendor}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(15)))
                            ],
                          ),
                          SizedBox(height: ScreenUtil.instance.setHeight(2)),
                          Row(
                            children: <Widget>[
                              Icon(Icons.account_circle,
                                  color: Color(0xFF00b89c)),
                              Text(' Added By :  ${data[index].addby}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(15)))
                            ],
                          ),
                          SizedBox(height: ScreenUtil.instance.setHeight(2)),
                          Row(
                            children: <Widget>[
                              Icon(Icons.query_builder,
                                  color: Color(0xFF00b89c)),
                              Text(' Added Date :  ${data[index].adddate}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(15)))
                            ],
                          ),
                          SizedBox(height: ScreenUtil.instance.setHeight(2)),
                          Row(
                            children: <Widget>[
                              Icon(Icons.check_circle,
                                  color: Color(0xFF00b89c)),
                              Text(' IC :  ${data[index].ic}',
                                  style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(15)))
                            ],
                          )
                        ],
                      ),
                    )));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: poList(),
        appBar: AppBar(
          title: AutoSizeText(
            'ประวัติการรับของ : $title',
            style: TextStyle(
              fontFamily: 'Prompt',
              color: Colors.white,
            ),
            minFontSize: 12,
            stepGranularity: 1,
            maxLines: 1,
          ),
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
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color(0xFF00b89c),
        //   child: Icon(Icons.add),
        //   onPressed: () {

        //   },
        // ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
              left: ScreenUtil.instance.setWidth(20),
              right: ScreenUtil.instance.setWidth(20),
              top: ScreenUtil.instance.setHeight(10),
              bottom: ScreenUtil.instance.setHeight(10)),
          child: RaisedButton(
            color: Color(0xFF00b89c),
            child: Text(
              'ทำรายการใหม่',
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(16), color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/po-new-entry',
                  arguments: ScreenArguments('P01234567890'));
            },
          ),
        ));
  }
}
// class PoHists extends StatefulWidget {

//   const PoHists({Key key}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return PoHistState();
//   }
// }
// class PoHistState extends State<PoHists> {
//   @override
//   Widget build(BuildContext context) {

//     return Placeholder();
//   }

// }
