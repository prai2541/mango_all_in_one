
import 'dart:io';

import 'package:app_ui/matadd.dart';
import 'package:app_ui/materialList.dart';
import 'package:badges/badges.dart';
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

List<String> status = ["DONE", "ADD", "ADD", "DONE"];

class PRAdd extends StatelessWidget {
  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('d MMMM y');
    return formatter.format(now);
  }
  //TabController tab;
  //GlobalKey tabkey = GlobalKey<PRAddsState>();
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PRAdds(),
    );
  }
}
class PRAdds extends StatefulWidget {
  
  const PRAdds({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PRAddsState();
  }
}
class PRAddsState extends State<PRAdds> with SingleTickerProviderStateMixin{

  static TabController tabctrl;
  @override
  void initState() {
    loadData();
    super.initState();
    tabctrl = TabController(vsync: this, length: 2);
  }

  void loadData() async {
    await MatViewModel.loadMat();
  }
  // @override
  // void dispose() {
  //   tabctrl.dispose();
  //   super.dispose();
  // }

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

  Widget matCodeField(ctrl) {
    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);
    return TextFormField(
      controller: ctrl,
      enabled: customizable,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: ScreenUtil.instance.setSp(16)
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {

          },
        ),
        hintText: 'Material Code',
        hintStyle: TextStyle(
        fontSize: ScreenUtil.instance.setSp(16)
      ),
      ),
    );
  }

  Widget matNameField(ctrl) {
    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);
    
    if (customizable) {
      return Container(
        padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(25), top: ScreenUtil.instance.setHeight(25), left: ScreenUtil.instance.setWidth(12), right: ScreenUtil.instance.setWidth(10)),
        child: Text(
          '$matName',
          style: TextStyle(
          fontSize: ScreenUtil.instance.setSp(16),
          color: Colors.grey[600]
          ),
        ),
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.grey[600]),
          borderRadius: new BorderRadius.all(
            const Radius.circular(5.0)
          )
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(25), top: ScreenUtil.instance.setHeight(25), left: ScreenUtil.instance.setWidth(12), right: ScreenUtil.instance.setWidth(10)),
        child: Text(
          '$matName',
          style: TextStyle(
          fontSize: ScreenUtil.instance.setSp(16),
          color: Colors.grey
          ),
        ),
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: new BorderRadius.all(
            const Radius.circular(5.0)
          )
        ),
      );
    }
  }

  Widget textField(text, ctrl) {
    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);
    return TextFormField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: ScreenUtil.instance.setSp(16)
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        hintText: text,
        hintStyle: TextStyle(
        fontSize: ScreenUtil.instance.setSp(16)
      ),
      ),
    );
  }

  Widget addPage() {
    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              //searchTextField.textField.controller.text = '';
              //key.currentState.clear();
            },
            child: ListView(
              //physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left:ScreenUtil.instance.setWidth(30), right: ScreenUtil.instance.setWidth(30), top:ScreenUtil.instance.setHeight(20),),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Switch(
                            value: customizable,
                            onChanged: (value) {
                              setState(() {
                              customizable = value;
                              mcCtrl.text = '';
                              mnCtrl.text = '';  
                              });
                            },
                            activeColor: Color(0xFF00b89c),
                          ),
                          Text('  กำหนดเอง',
                          style: TextStyle(fontSize: ScreenUtil.instance.setSp(16)),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      onTap: () async {
                        if(!customizable) {
                          // only do shit if customizable is false
                          // Navigator.of(context).pushNamed('/mat-add');
                          MaterialList result = await Navigator.push(context, MaterialPageRoute(builder: (context) => MatAdd()));
                          if(result != null) {  
                            setState(() {
                            mcCtrl.text = result.matcode; 
                            matName = result.matname;
                          });

                          } 
                         
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF00b89c))
                        ),
                        child: Row(
                          children: <Widget>[
                            Text('เพิ่ม ', style: TextStyle(color: Color(0xFF00b89c),fontSize: ScreenUtil.instance.setSp(16))),
                            Icon(Icons.playlist_add, color: Color(0xFF00b89c),),
                            SizedBox(width: 10,)
                          ],
                        ),
                      )
                    )
                  ]
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(30)),
                matCodeField(mcCtrl),
                SizedBox(height: ScreenUtil.instance.setHeight(20)),
                matNameField(mnCtrl),
                SizedBox(height: ScreenUtil.instance.setHeight(20)),
                textField('Quantity', qtyCtrl),
                SizedBox(height: ScreenUtil.instance.setHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: textField('Unit', unitCtrl),
                    ),
                    SizedBox(width: ScreenUtil.instance.setWidth(20)),
                    Flexible(
                      child: textField('Price / Unit', ppnCtrl),
                    )
                  ],
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(70)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    RaisedButton(
                      onPressed: () {
                        MaterialObj newdata = MaterialObj(matcode: mcCtrl.text, matname: matname, qty: int.parse(qtyCtrl.text), unit: int.parse(unitCtrl.text), ppn: int.parse(ppnCtrl.text));
                        setState(() {
                          data.add(newdata);
                          mcCtrl.text = '';
                          qtyCtrl.text = '';
                          unitCtrl.text = '';
                          ppnCtrl.text = '';
                        });
                        tabctrl.animateTo((tabctrl.index +1) %2);
                                      
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF4BA092),
                              Color(0xFF8AD696),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(10), top: ScreenUtil.instance.setHeight(10), left: ScreenUtil.instance.setWidth(35), right: ScreenUtil.instance.setWidth(35)),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Continue',
                                  style: TextStyle(fontSize: ScreenUtil.instance.setSp(25),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ]
                            )
                          )
                        ),
                      ),
                    ]
                  ),
              
              ],
            )
    );
  }

  

  Widget listPage() {

    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      padding: EdgeInsets.only(left:ScreenUtil.instance.setWidth(30), right: ScreenUtil.instance.setWidth(30), top:ScreenUtil.instance.setHeight(20),),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                onTap: () {
                  // if(customizable) {
                  //   // only do shit if customizable is false
                  // }
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF00b89c))
                  ),
                  child: Row(
                    children: <Widget>[
                      Text('Confirm ', style: TextStyle(color: Color(0xFF00b89c), fontSize: ScreenUtil.instance.setSp(16))),
                      Icon(Icons.playlist_add, color: Color(0xFF00b89c),),
                      SizedBox(width: 10,)
                    ],
                  ),
                )
              )
            ],
          ),
          SizedBox(height: ScreenUtil.instance.setHeight(15)),
          Flexible(
            child:ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
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
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Quantity', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Units', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Price per Unit', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                  Text(': ${data[index].matcode}', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].matname}', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].qty}', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].unit}', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].ppn}', 
                                    style: TextStyle(
                                      fontSize: ScreenUtil.instance.setSp(16)
                                    ),
                                  ),
                                ],
                          ),


                        ]
                      ),
                        
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete_outline),
                            iconSize: ScreenUtil.instance.setSp(20),
                            color: Colors.red,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Confirm Delete?'),
                                    content: Text('This will delete your current entry'),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Yes'),
                                        onPressed: () {
                                          //Navigator.of(context).pop();
                                          setState(() {
                                            data.removeAt(index); 
                                          });

                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          
                                        },
                                      )
                                    ],
                                  );
                                }
                              );
                            }
                          )
                        ]
                      )
                    ]
                  )
                )
              );
            },
            )
          )
        ],
      )
    );
  }
  

  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: ScreenUtil.instance.setSp(30),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                  }
                )
              ],
              bottom: TabBar(
                indicatorColor: Color(0xFFB8001C),
                indicatorWeight: 3.0,
                labelColor: Color(0xFFB8001C),
                labelStyle: TextStyle(fontSize: ScreenUtil.instance.setSp(16)),
                unselectedLabelColor: Colors.white,
                controller: tabctrl,
                tabs: [
                  Tab(child: Text('Add', style: TextStyle(fontFamily: 'Prompt'))),
                  Tab(child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('List', style: TextStyle(fontFamily: 'Prompt')),
                        SizedBox(width: ScreenUtil.instance.setWidth(10)),
                        Badge(
                          position: BadgePosition.topRight(top: -5, right: -5),
                          animationDuration: Duration(milliseconds: 300),
                          animationType: BadgeAnimationType.scale,
                          padding: EdgeInsets.all(7.5),
                          badgeContent: Text(
                            '${data.length}',
                            style: TextStyle(color: Colors.white, fontSize: ScreenUtil.instance.setSp(12)),
                          ),)
                    ])
                  ),
                ],
              ),
              title: Text(
                'PR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TabBarView(
                    controller: tabctrl,
                    children: <Widget>[addPage(), listPage()],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}



