import 'dart:io';

import 'package:app_ui/po_list_info.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class NewPoEntry extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${args.title}', style: TextStyle(fontFamily: 'Prompt', color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: NewPoEntrys(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left:ScreenUtil.instance.setWidth(20), right:ScreenUtil.instance.setWidth(20), top:ScreenUtil.instance.setHeight(10), bottom: ScreenUtil.instance.setHeight(10)),
        child:RaisedButton(
          color: Color(0xFF00b89c),
          child: Text('Save', style: TextStyle(fontSize: ScreenUtil.instance.setSp(16), color: Colors.white),),
          onPressed: () {
             //Navigator.of(context).pushNamed('/po-new-entry', arguments: ScreenArguments('P01234567890'));
          },
        ),
    )
    );
  }

}

class NewPoEntrys extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   
    return NewPoEntryState();
  }

}

class NewPoEntryState extends State<NewPoEntrys> {

  var time = '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  var duedate;
  var taxdate;
  var dodate;
  var selectedDate;
  var comply = 1;
  var complete = 1;
  var onTime = 1;
  var excellent = 1;
  TextEditingController termctrl =  TextEditingController();
  TextEditingController exctrl =  TextEditingController();
  TextEditingController tnctrl =  TextEditingController();
  TextEditingController dnctrl =  TextEditingController();
  TextEditingController rectrl =  TextEditingController();
  List<File> imglist = [];
  bool ic = false;
  bool all = false;


  Future getImage1() async {
    var img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img == null) return;
    setState(() {
      this.imglist.add(img);
    });
  }
    

  Widget textfield(String title, controller) {
    return Row(
      children: <Widget>[
        Expanded(flex: 3, child: Text('$title', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14)))),
        Expanded(flex: 5, child: Container(height: ScreenUtil.instance.setHeight(60), child: TextFormField(
          autocorrect: false,
          controller: controller,
          style: TextStyle(
            fontSize: ScreenUtil.instance.setSp(14)
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(12), bottom: ScreenUtil.instance.setHeight(12), left: ScreenUtil.instance.setWidth(10), right: ScreenUtil.instance.setWidth(10)),
            border: OutlineInputBorder(
              //gapPadding: 0,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.black)
            ),
          )
        )))
      ],
    );
  }
  Future<Null> _selectDate1(BuildContext context) async {
    duedate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: duedate,
        firstDate: DateTime(duedate.year, duedate.month, duedate.day),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Color(0xFF46B5A6),
              primaryTextTheme: TextTheme(display1: TextStyle(color: Colors.white))),
            child: child,);
        }

        );
    if (picked != null )
      setState(() {
        duedate = picked;
      });
  }
  Future<Null> _selectDate2(BuildContext context) async {
    taxdate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: taxdate,
        firstDate: DateTime(taxdate.year, taxdate.month, taxdate.day),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Color(0xFF46B5A6),
              primaryTextTheme: TextTheme(display1: TextStyle(color: Colors.white))),
            child: child,);
        }

        );
    if (picked != null )
      setState(() {
        taxdate = picked;
      });
  }
  Future<Null> _selectDate3(BuildContext context) async {
    dodate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dodate,
        firstDate: DateTime(dodate.year, dodate.month, dodate.day),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Color(0xFF46B5A6),
              primaryTextTheme: TextTheme(display1: TextStyle(color: Colors.white))),
            child: child,);
        }

        );
    if (picked != null )
      setState(() {
        dodate = picked;
      });
  }
  

  Widget datepicker1(DateTime date) {
    
    var time1 = time;    
    
    
    
    if (date == null) {
      return Expanded(
        flex: 5,
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$time1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate1(context),
              )
            ],
          ),
        ),
      );
    } else {
        var unix = date;
        var date1 = '${unix.day}/${unix.month}/${unix.year}';
        return Expanded(
        flex: 5,
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$date1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate1(context),
                    )
            ],
          ),
        ),
      );
    }
    
  }
  Widget datepicker2(DateTime date) {
    
    var time1 = time;    
    
    
    
    if (date == null) {
      return Expanded(
        flex: 5,
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$time1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate2(context),
              )
            ],
          ),
        ),
      );
    } else {
        var unix = date;
        var date1 = '${unix.day}/${unix.month}/${unix.year}';
        return Expanded(
        flex: 5,
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$date1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate2(context),
                    )
            ],
          ),
        ),
      );
    }
    
  }
  Widget datepicker3(DateTime date) {
    
    var time1 = time;    
    
    
    
    if (date == null) {
      return Expanded(
        flex: 5,
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$time1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate3(context),
              )
            ],
          ),
        ),
      );
    } else {
        var unix = date;
        var date1 = '${unix.day}/${unix.month}/${unix.year}';
        return Expanded(
        flex: 5,
        child: Container(
          padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(10)),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[600]),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$date1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate3(context),
                    )
            ],
          ),
        ),
      );
    }
    
  }

  Widget photoSection() {
    if(imglist.length == 0) {
      return Card(
          margin: EdgeInsets.all(5),
          child: Container(
            //padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 500,
                color: Color(0xFF00b89c),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนที่ 4 : ข้อมูลการประเมิน',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF00b89c))
                      ),
                      
                      child: FlatButton(
                        child: Row(
                          children: [
                            Icon(Icons.add_a_photo),
                            SizedBox(width: 10,),
                            Text('Add a Photo')
                          ]
                          ),
                        onPressed: getImage1,
                      ))
                  ]
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(10)),
              ])));
                
    } else {
      return Card(
          margin: EdgeInsets.all(5),
          child: Container(
            //padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 500,
                color: Color(0xFF00b89c),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนที่ 4 : ข้อมูลการประเมิน',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF00b89c))
                      ),
                      
                      child: FlatButton(
                        child: Row(
                          children: [
                            Icon(Icons.add_a_photo),
                            SizedBox(width: 10,),
                            Text('Add a Photo')
                          ]
                          ),
                        onPressed: getImage1,
                      ))
                ]),
                GridView.builder(
                  
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 4),
                  itemCount: imglist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: ScreenUtil.instance.setWidth(200),
                      child:Badge(
                      elevation: 2,
                      badgeColor: Colors.white,
                      position: BadgePosition.topRight(top: 5, right: 5),
                      padding: EdgeInsets.all(0),
                      badgeContent: InkWell(
                        //padding: EdgeInsets.all(1),
                        child: Icon(Icons.clear,color: Colors.black,
                        size: ScreenUtil.instance.setWidth(20)),
                        onTap: () {
                          setState(() {
                           imglist.removeAt(index); 
                          });
                        },
                        
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: ScreenUtil.instance.setHeight(150),
                          width: ScreenUtil.instance.setWidth(100),
                          child:Image.file(imglist[index],
                            fit: BoxFit.fill,
                            height: ScreenUtil.instance.setHeight(150)),
                      ))));
                  },
                )

                
                
              ],
            )
          )
        );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    

    
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child:ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(5),
          child: Container(
            //padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 500,
                color: Color(0xFF00b89c),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนที่ 1 : ข้อมูลทั่วไป',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: ScreenUtil.instance.setHeight(20)),
                      Text('Company Name', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))),
                      SizedBox(height: ScreenUtil.instance.setHeight(30)),
                      Row(
                        children: <Widget>[
                          Expanded(flex: 3, child: Text('Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14)))),
                          Expanded(flex: 5, child: Text('$time', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14))))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(20)),
                      textfield('Term', termctrl),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text('Due Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14)))),
                          datepicker1(duedate)
                        ]
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      textfield('Exchange', exctrl),
                      
                    ],
                  ),
                )
                
              ],
            )
          )
        ),
        Card(
          margin: EdgeInsets.all(5),
          child: Container(
            //padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 500,
                color: Color(0xFF00b89c),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนที่ 2 : การบันทึกข้อมูล Tax, Invoices',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SizedBox(height: ScreenUtil.instance.setHeight(30)),
                      textfield('Tax No', tnctrl),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text('Tax Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14)))),
                          datepicker2(taxdate)
                        ]
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      textfield('Do No', dnctrl),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text('Do Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(14)))),
                          datepicker3(dodate)
                        ]
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      textfield('Remark', rectrl),
                      
                    ],
                  ),
                )
                
              ],
            )
          )
        ),
        Card(
          elevation: 3,
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 500,
                color: Color(0xFF00b89c),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนที่ 3 : ข้อมูลการประเมิน',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Quality :'),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            activeColor: Color(0xFF00b89c),
                            value: 1,
                            title: Text(
                              'Comply',
                              style: TextStyle(fontSize: 12),
                            ),
                            groupValue: comply,
                            onChanged: (value) {
                              setState(() {
                                comply = value;
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: Color(0xFF00b89c),
                            value: 0,
                            title: Text('Not Comply',
                                style: TextStyle(fontSize: 12)),
                            groupValue: comply,
                            onChanged: (value) {
                              setState(() {
                                comply = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 100,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            activeColor: Color(0xFF00b89c),
                            value: 1,
                            title: Text('Complete',
                                style: TextStyle(fontSize: 12)),
                            groupValue: complete,
                            onChanged: (value) {
                              setState(() {
                                complete = value;
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: Color(0xFF00b89c),
                            value: 0,
                            title: Text('Not Complete',
                                style: TextStyle(fontSize: 12)),
                            groupValue: complete,
                            onChanged: (value) {
                              setState(() {
                                complete = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text('Service :'),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            value: 1,
                            activeColor: Color(0xFF00b89c),
                            title: Text(
                              'On time',
                              style: TextStyle(fontSize: 12),
                            ),
                            groupValue: onTime,
                            onChanged: (value) {
                              setState(() {
                                onTime = value;
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: Color(0xFF00b89c),
                            value: 0,
                            title: Text('Late', style: TextStyle(fontSize: 12)),
                            groupValue: onTime,
                            onChanged: (value) {
                              setState(() {
                                onTime = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 100,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            activeColor: Color(0xFF00b89c),
                            value: 1,
                            title: Text('Excellent',
                                style: TextStyle(fontSize: 12)),
                            groupValue: excellent,
                            onChanged: (value) {
                              setState(() {
                                excellent = value;
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: Color(0xFF00b89c),
                            value: 0,
                            title: Text('Poor', style: TextStyle(fontSize: 12)),
                            groupValue: excellent,
                            onChanged: (value) {
                              setState(() {
                                excellent = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        photoSection(),
        Card(
          margin: EdgeInsets.all(5),
          child: Container(
            //padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                width: 500,
                color: Color(0xFF00b89c),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนที่ 5 : เลือกรายการที่ต้องการรับของ',
                    style: TextStyle(color: Colors.white)
                  ),
                ),
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: ic,
                      activeColor: Color(0xFF00b89c),
                      onChanged: (v) {
                        setState(() {
                         ic = v; 
                        });
                      },
                    ),
                    SizedBox(width: ScreenUtil.instance.setWidth(10)),
                    Text('IC Recieve'),
                    SizedBox(width: ScreenUtil.instance.setWidth(10)),
                    Checkbox(
                      value: all,
                      activeColor: Color(0xFF00b89c),
                      onChanged: (v) {
                        setState(() {
                         all = v; 
                        });
                      },
                    ),
                    SizedBox(width: ScreenUtil.instance.setWidth(10)),
                    Text('Recieve All')
                  ],)
                

                
                
              ],
            )
          )
        ),
      ],
    ));
  }

}