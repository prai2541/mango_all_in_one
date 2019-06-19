// import 'package:app_ui/employeeDetail.dart';
// import 'package:app_ui/newDCEntry.dart';
// import 'package:badges/badges.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'material.dart';
import 'players.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:autocomplete_textfield/autocomplete_textfield.dart';

//import 'package:image_picker/image_picker.dart';

//import 'editDCEntry.dart';

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
  bool customizable = false;
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
    return TextFormField(
      controller: ctrl,
      enabled: customizable,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {

          },
        ),
        hintText: 'Material Code',
      ),
    );
  }

  Widget matNameField(ctrl) {
    
    if (customizable) {
      return Container(
        padding: EdgeInsets.only(bottom: 20, top: 20, left: 12, right: 10),
        child: Text(
          '$matName',
          style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600]
          ),
        ),
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.grey[600]),
          borderRadius: new BorderRadius.all(
            const Radius.circular(40.0)
          )
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(bottom: 20, top: 20, left: 12, right: 10),
        child: Text(
          '$matName',
          style: TextStyle(
          fontSize: 16,
          color: Colors.grey
          ),
        ),
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: new BorderRadius.all(
            const Radius.circular(40.0)
          )
        ),
      );
    }
  }

  Widget textField(text, ctrl) {
    return TextFormField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        hintText: text,
      ),
    );
  }

  Widget addPage() {
    double defaultScreenWidth = 1440.0;
    double defaultScreenHeight = 2960.0;

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
              padding: EdgeInsets.all(ScreenUtil.instance.setWidth(80)),
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
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      onTap: () {
                        if(customizable) {
                          // only do shit if customizable is false
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
                            Text('เพิ่ม ', style: TextStyle(color: Color(0xFF00b89c))),
                            Icon(Icons.playlist_add, color: Color(0xFF00b89c),),
                            SizedBox(width: 10,)
                          ],
                        ),
                      )
                    )
                  ]
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(100)),
                matCodeField(mcCtrl),
                SizedBox(height: ScreenUtil.instance.setHeight(60)),
                matNameField(mnCtrl),
                SizedBox(height: ScreenUtil.instance.setHeight(60)),
                textField('Quantity', qtyCtrl),
                SizedBox(height: ScreenUtil.instance.setHeight(60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: textField('Unit', unitCtrl),
                    ),
                    SizedBox(width: ScreenUtil.instance.setWidth(70)),
                    Flexible(
                      child: textField('Price / Unit', ppnCtrl),
                    )
                  ],
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    RaisedButton(
                      onPressed: () {
                        MaterialObj newdata = MaterialObj(matcode: mcCtrl.text, matname: matname, qty: int.parse(qtyCtrl.text), unit: int.parse(unitCtrl.text), ppn: int.parse(ppnCtrl.text));
                        setState(() {
                          data.add(newdata);
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
                        padding: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Continue',
                                  style: TextStyle(fontSize: 25,
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

    double defaultScreenWidth = 1440.0;
    double defaultScreenHeight = 2960.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      padding: EdgeInsets.all(ScreenUtil.instance.setWidth(60)),
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
                      Text('Confirm ', style: TextStyle(color: Color(0xFF00b89c))),
                      Icon(Icons.playlist_add, color: Color(0xFF00b89c),),
                      SizedBox(width: 10,)
                    ],
                  ),
                )
              )
            ],
          ),
          SizedBox(height: ScreenUtil.instance.setHeight(40)),
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
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Material Name', 
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Quantity', 
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Units', 
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text('Price per Unit', 
                                    style: TextStyle(
                                      fontSize: 18
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
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].matname}', 
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].qty}', 
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].unit}', 
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                                  Text(': ${data[index].ppn}', 
                                    style: TextStyle(
                                      fontSize: 18
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
                            iconSize: 20,
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
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: ScreenUtil.instance.setSp(100),
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
                labelStyle: TextStyle(fontSize: 18),
                unselectedLabelColor: Colors.white,
                controller: tabctrl,
                tabs: [
                  Tab(child: Text('Add')),
                  Tab(child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('List'),
                        SizedBox(width: ScreenUtil.instance.setWidth(40)),
                        Badge(
                          position: BadgePosition.topRight(top: -5, right: -5),
                          animationDuration: Duration(milliseconds: 300),
                          animationType: BadgeAnimationType.scale,
                          padding: EdgeInsets.all(ScreenUtil.instance.setWidth(22.5)),
                          badgeContent: Text(
                            '${data.length}',
                            style: TextStyle(color: Colors.white, fontSize: 12.5),
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



