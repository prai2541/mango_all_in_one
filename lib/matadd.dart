
import 'package:app_ui/materialList.dart';
//import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'material.dart';


List<String> name = [
  "Suzanne	Steele",
  'Lila	Cummings',
  'Joe	Young',
  'Samuel	Barker'
];

//List<String> status = ["DONE", "ADD", "ADD", "DONE"];

class MatAdd extends StatelessWidget {
  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('d MMMM y');
    return formatter.format(now);
  }
  //TabController tab;
  //GlobalKey tabkey = GlobalKey<MatAddsState>();
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MatAdds(),
    );
  }
}
class MatAdds extends StatefulWidget {
  
  const MatAdds({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MatAddsState();
  }
}
class MatAddsState extends State<MatAdds> with SingleTickerProviderStateMixin{

  MaterialObj obj; 
  String matcode;
  String matname = 'xddd';
  int qty;
  int unit; 
  int ppn;
  bool customizable = true;
  String matName = 'Material Name';
  TextEditingController mcCtrl = TextEditingController();
  TextEditingController mnCtrl = TextEditingController();
  TextEditingController qtyCtrl = TextEditingController();
  TextEditingController unitCtrl = TextEditingController();
  TextEditingController ppnCtrl = TextEditingController();
  GlobalKey key = new GlobalKey();

 
  List<MaterialObj> data = [
    MaterialObj(matcode: '1', matname: '1', qty: 1, unit: 1, ppn: 1),
  ];
  List<MaterialList > matlist = [MaterialList(matcode: '1', matname: '1'),MaterialList(matcode: '2', matname: '2'),MaterialList(matcode: '3', matname: '3')];
  

  

  

  Widget matList() {

    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      padding: EdgeInsets.only(left:ScreenUtil.instance.setWidth(30), right: ScreenUtil.instance.setWidth(30), top:ScreenUtil.instance.setHeight(20)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('รายการทั้งหมด', style: TextStyle(fontSize: ScreenUtil.instance.setSp(16)),),
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
            child:ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: matlist.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                onTap: () {
                  MaterialList mat = MaterialList(matcode: matlist[index].matcode, matname: matlist[index].matname);
                  Navigator.pop(context, mat);
                },
                child: Card(
                
                margin: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                  Text('Material Code', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Material Name', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                                  Text(': ${matlist[index].matcode}', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${matlist[index].matname}', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                ],
                          ),
                          Spacer(),
                          Icon(Icons.check, size: ScreenUtil.instance.setSp(25),color: Color(0xFF00b89c)),


                        ]
                      ),
                      
                      
                        
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                         
                            
                      //   ]
                      // )
                    ]
                  )
                )
              ));
            },
            )
          )
        ],
      )
    );
  }
  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('MATERIAL LIST', style: TextStyle(fontFamily: 'Prompt', color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
              Icons.home,
              size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              },
            )
          ],
      ),
      body: matList(),
    );
  }
}