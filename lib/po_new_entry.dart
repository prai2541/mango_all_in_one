import 'package:app_ui/po_list_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: NewPoEntrys(),
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
    

  Widget textfield(String title, controller) {
    return Row(
      children: <Widget>[
        Expanded(flex: 3, child: Text('$title', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18)))),
        Expanded(flex: 5, child: Container(height: ScreenUtil.instance.setHeight(60), child: TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: ScreenUtil.instance.setSp(18)
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
              Text('$time1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
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
              Text('$date1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
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
              Text('$time1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
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
              Text('$date1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
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
              Text('$time1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
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
              Text('$date1', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
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
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Part 1 : General Information', style: TextStyle(fontSize: ScreenUtil.instance.setSp(20))),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: ScreenUtil.instance.setHeight(20)),
                      Text('Kaiba Corperation', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))),
                      SizedBox(height: ScreenUtil.instance.setHeight(30)),
                      Row(
                        children: <Widget>[
                          Expanded(flex: 3, child: Text('Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18)))),
                          Expanded(flex: 5, child: Text('$time', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18))))
                        ],
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      textfield('Term', termctrl),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text('Due Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18)))),
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
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Part 2 : Tax, Invoices', style: TextStyle(fontSize: ScreenUtil.instance.setSp(20))),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: ScreenUtil.instance.setHeight(30)),
                      textfield('Tax No', tnctrl),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text('Tax Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18)))),
                          datepicker2(taxdate)
                        ]
                      ),
                      SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      textfield('Do No', dnctrl),
                      //SizedBox(height: ScreenUtil.instance.setHeight(10)),
                      Row(
                        children: [
                          Expanded(flex: 3, child: Text('Do Date', style: TextStyle(fontSize: ScreenUtil.instance.setSp(18)))),
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
                color: Colors.blue,
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
      ],
    ));
  }

}