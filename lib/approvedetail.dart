import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApproveDetail extends StatelessWidget {
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
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff46B5A6),
            iconTheme: IconThemeData(color: Colors.white),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.home,
                    size: ScreenUtil.instance.setSp(30),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  })
            ],
            bottom: TabBar(
              indicatorColor: Color(0xFFB8001C),
                indicatorWeight: 3.0,
                labelColor: Color(0xFFB8001C),
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "รายละเอียดเอกสาร",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(16)),
                  ),
                ),
                Tab(
                  child: Text(
                    "รายละเอียดสินค้า",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.instance.setSp(16)),
                  ),
                ),
              ],
            ),
            title: Text('Approve', style: TextStyle(color: Colors.white)),
          ),
          body: TabBarView(
            children: <Widget>[
              DocDetail(),
              ProductDetail()
            ],
          ),
        ),
      ),
    );
  }
}

class DocDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              item('P/R No. :', 'white'),
              item('วันที่ :', 'grey'),
              item('Approve :', 'white'),
              item('Attached File :', 'grey'),
              item('ผู้ขอซื้อ :', 'white'),
              item('โครงการ :', 'grey'),
              item('ระบบ :', 'white'),
              item('แผนก :', 'grey'),
              item('ผู้ขาย :', 'white'),
              item('PR for :', 'grey'),
              item('Currency :', 'white'),
              item('Exchange Rate :', 'grey'),
              item('ประเภทสั่งซื้อ :', 'white'),
              item('หมายเหตุ :', 'grey'),
              item('สถานที่ส่งของ :', 'white'),
              item('วันที่ส่งของ :', 'grey'),
              item('รหัสผู้รับเหมา :', 'white'),
              item('Submit :', 'grey'),
            ],
          ),
          Container(height: ScreenUtil.instance.setHeight(1080), width: 1, child:VerticalDivider(color: Colors.black)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              item2('PRM201906003', 'white'),
              item2('14/06/2019', 'grey'),
              item2('No', 'white'),
              item2('000000000000000000000000000000000000', 'grey'),
              item2('006 John Philip', 'white'),
              item2('00102019 Project mui 2019', 'grey'),
              item2('JOB', 'white'),
              item2('', 'grey'),
              item2('', 'white'),
              item2('', 'grey'),
              item2('Baht', 'white'),
              item2('1.00', 'grey'),
              item2('Cost', 'white'),
              item2('', 'grey'),
              item2('Project mui 2019', 'white'),
              item2('14/6/2019', 'grey'),
              item2('', 'white'),
              item2('Y', 'grey'),
            ],
          )
        ],
      )
      ]);
  }

  Widget item(String text, String color) {
    if(color == 'white') {
      return Container(
        margin: EdgeInsets.all(0),
        width: ScreenUtil.instance.setWidth(150),
        height: ScreenUtil.instance.setHeight(60),
        padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(7), bottom: ScreenUtil.instance.setHeight(7)),
        color: Colors.white,
        child: Center(child:Text('$text', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))))
      );
    } else {
      return Container(
        width: ScreenUtil.instance.setWidth(150),
        height: ScreenUtil.instance.setHeight(60),
        padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(7), bottom: ScreenUtil.instance.setHeight(7)),
        color: Color(0xFFF7FAFF),
        child: Center(child:Text('$text', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))))
      );
    }
    
  }
  Widget item2(String text, String color) {
    if(color == 'white') {
      return Container(
        margin: EdgeInsets.all(0),
        width: ScreenUtil.instance.setWidth(224),
        height: ScreenUtil.instance.setHeight(60),
        padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20), top: ScreenUtil.instance.setHeight(7), bottom: ScreenUtil.instance.setHeight(7), right: ScreenUtil.instance.setWidth(10)),
        color: Colors.white,
        child: Center(child:AutoSizeText('$text', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14)), stepGranularity: 1, maxLines: 1))
      );
    } else {
      return Container(
        width: ScreenUtil.instance.setWidth(224),
        height: ScreenUtil.instance.setHeight(60),
        padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20), top: ScreenUtil.instance.setHeight(7), bottom: ScreenUtil.instance.setHeight(7), right: ScreenUtil.instance.setWidth(10)),
        color: Color(0xFFF7FAFF),
        child: Center(child:AutoSizeText('$text', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14)), stepGranularity: 1, maxLines: 1))
      );
    }
    
  }

}

class ProductDetail extends StatelessWidget{

  // Product p1 = Product('costno', 'costname', 'matcode');
  // Product p2 = Product('costno', 'costname', 'matcode');
  // Product p3 = Product('costno', 'costname', 'matcode');
  List<Product> data = [Product('','',''),Product('12345', 'idk what im doing', 'help me pls'),Product('678901', 'hello', 'xdddd'),Product('costno', 'costname', 'matcode')];
  

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        if (index != 0) {
          return Column(
            children: [
            Container(
            height: ScreenUtil.instance.setHeight(80),
            //padding: EdgeInsets.only(right: ScreenUtil.instance.setWidth(10)),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    '$index',
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14)),
                ))),
              Container(height: ScreenUtil.instance.setHeight(80), width: 1, child:VerticalDivider(color: Colors.black)),
              Expanded(
                flex: 4,
                child: Center(
                  child: AutoSizeText(
                    '${data[index].costno}',
                    maxLines: 1,
                    stepGranularity: 1,
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14)),
                ))),
              Container(height: ScreenUtil.instance.setHeight(80), width: 1, child:VerticalDivider(color: Colors.black)),
              Expanded(
                flex: 4,
                child: Center(
                  child: AutoSizeText(
                    '${data[index].costname}',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    stepGranularity: 1,
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14)),
                ))),
              Container(height: ScreenUtil.instance.setHeight(80), width: 1, child:VerticalDivider(color: Colors.black)),
              Expanded(
                flex: 5,
                child: Center(
                  child: AutoSizeText(
                    '${data[index].matcode}',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    stepGranularity: 1,
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14)),
                ))),
            ],
          )),
          Divider(height: 1, color: Colors.black,),
        ]);
        } else {
          return Container(
            height: ScreenUtil.instance.setHeight(80),
            color: Color(0xFF508DBF),
            //padding: EdgeInsets.only(rSight: ScreenUtil.instance.setWidth(10)),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'No.',
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14), color: Colors.white),
                    
                ))),
              Container(height: ScreenUtil.instance.setHeight(80), width: 1, child:VerticalDivider(color: Colors.black)),

              Expanded(
                flex: 4,
                child: Center(
                  child: AutoSizeText(
                    'Cost No.',
                    maxLines: 1,
                    stepGranularity: 1,
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14), color: Colors.white),
                ))),
              Container(height: ScreenUtil.instance.setHeight(80), width: 1, child:VerticalDivider(color: Colors.black)),
              Expanded(
                flex: 4,
                child: Center(
                  child: AutoSizeText(
                    'Cost Name',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    stepGranularity: 1,
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14), color: Colors.white),
                ))),
              Container(height: ScreenUtil.instance.setHeight(80), width: 1, child:VerticalDivider(color: Colors.black)),
              Expanded(
                flex: 5,
                child: Center(
                  child: AutoSizeText(
                    'Mat code.',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    stepGranularity: 1,
                    style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(14), color: Colors.white),
                ))),
            ],
          ));
        }
      },
    );
  }

}

class Product {
  String costno;
  String costname;
  String matcode;

  Product(this.costno, this.costname, this.matcode);
}