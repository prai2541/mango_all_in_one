import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Data {
  String monthYear;
  int backLog;
  int costLog;

  Data({this.monthYear, this.backLog, this.costLog});
}

var datas = <Data>[
  Data(monthYear: "May-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Jun-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Jul-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Aug-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Sep-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Oct-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Nov-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Dec-2018", backLog: 200000, costLog: 500000),
  Data(monthYear: "Jan-2019", backLog: 200000, costLog: 500000),
  Data(monthYear: "Feb-2019", backLog: 200000, costLog: 500000),
];

class ProjectionDetail extends StatelessWidget {
  final String projectName;
  final String docnumber;
  final String remark;

  ProjectionDetail(this.docnumber, this.remark, this.projectName);

  Widget bodyData(context) => Card(
        elevation: 5,
        margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10), bottom: ScreenUtil.instance.setHeight(10), left: ScreenUtil.instance.setWidth(20), right: ScreenUtil.instance.setWidth(20) ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: <Widget>[
          Container(
              color: Colors.transparent,
              child: Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(10),
                      top: ScreenUtil.instance.setHeight(10),
                      bottom: ScreenUtil.instance.setHeight(10)),
                  decoration: BoxDecoration(
                      color: Color(0xff38414f),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Month - Year',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil.instance.setSp(14)),
                          )),
                      Container(
                          height: ScreenUtil.instance.setHeight(50),
                          child: VerticalDivider(color: Colors.white)),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Text(
                                'Amount',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil.instance.setSp(14)),
                              )),
                              Divider(
                                color: Colors.white,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Back Log',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            ScreenUtil.instance.setSp(14)),
                                  ),
                                  Container(
                                      height: ScreenUtil.instance.setHeight(20),
                                      child:
                                          VerticalDivider(color: Colors.white)),
                                  Text(
                                    'Cost Log',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            ScreenUtil.instance.setSp(14)),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ))),
          SizedBox(height: ScreenUtil.instance.setHeight(5),),
          Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: Center(
                                child: Text(
                              datas[index].monthYear,
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(14)),
                            ))),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text(
                              datas[index].backLog.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(14)),
                            ))),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text(datas[index].costLog.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                                    style: TextStyle(
                                        fontSize:
                                            ScreenUtil.instance.setSp(14))))),
                      ],
                    ),
                    Divider(),
                  ]));
            },
          ))
        ]),
      );

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil.instance.setHeight(215)),
          child: AppBar(
            title: Text('Projection', style: TextStyle(fontFamily: 'Prompt', color: Colors.white)),
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Center(
                child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(
                        top: ScreenUtil.instance.setHeight(100),
                        left: ScreenUtil.instance.setWidth(15),
                        right: ScreenUtil.instance.setWidth(15)),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Doc. No. : $docnumber',
                                  style: TextStyle(
                                    fontSize: ScreenUtil.instance.setSp(16),
                                  ),
                                )),
                                Container(
                                    child: Text(
                                      'Remark : $remark',
                                      style: TextStyle(
                                        fontSize: ScreenUtil.instance.setSp(16),
                                      ),
                                    )),
                                Container(
                                    child: Text(
                                      'Project : $projectName',
                                      style: TextStyle(
                                        fontSize: ScreenUtil.instance.setSp(16),
                                      ),
                                    )),
                              ],
                            )
                          
                    )),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: ScreenUtil.instance.setSp(30),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (Route<dynamic> route) => false);
                },
              )
            ],
          )),
      body: Container(
        child: bodyData(context),
      ),
    );
  }
}
