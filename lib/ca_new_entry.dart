import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewCAEntry extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Count Assets',
              style: TextStyle(fontFamily: 'Prompt', color: Colors.white)),
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
        body: NewCAEntrys(),
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
              Expanded(
                flex: 1,
                child: RaisedButton(
                  color: Color(0xFF00b89c),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(16),
                        color: Colors.white),
                  ),
                  onPressed: () {
                    // Navigator.of(context).pushNamed('/po-new-entry',
                    //     arguments: ScreenArguments('P01234567890'));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class NewCAEntrys extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewCAEntryState();
  }
}

class NewCAEntryState extends State<NewCAEntrys> {
  TextEditingController docctrl = new TextEditingController();
  String doctext = '';
  bool doc = true;
  TextEditingController codectrl = new TextEditingController();
  String codetext = '';
  bool code = true;
  TextEditingController namectrl = new TextEditingController();
  String nametext = '';
  bool name = true;
  TextEditingController serialctrl = new TextEditingController();
  String serialtext = '';
  bool serial = true;
  TextEditingController qtyctrl = new TextEditingController();
  String qtytext = '';
  bool qty = true;
  TextEditingController prjctrl = new TextEditingController();
  String prjtext = '';
  bool prj = true;
  TextEditingController refctrl = new TextEditingController();
  String reftext = '';
  bool ref = true;
  TextEditingController unamectrl = new TextEditingController();
  String unametext = '';
  bool uname = true;
  TextEditingController remarkctrl = new TextEditingController();
  String remarktext = '';
  bool remark = true;
  TextEditingController locctrl = new TextEditingController();
  String loctext = '';
  bool loc = true;
  TextEditingController usebyctrl = new TextEditingController();
  String usebytext = '';
  bool useby = true;

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
                    textfield(Icons.insert_drive_file, ' Document No.',
                        'Document No', docctrl, doc),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: textfield(Icons.insert_drive_file,
                              ' Asset Code', '$codetext', codectrl, code),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.search),
                            iconSize: ScreenUtil.instance.setSp(40),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(
                        Icons.apps, " Asset Name", nametext, namectrl, name),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.menu, " Serial Number", serialtext,
                        serialctrl, serial),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: textfield(Icons.format_align_left, " Project",
                              prjtext, prjctrl, prj),
                        ),
                        SizedBox(
                          width: ScreenUtil.instance.setWidth(10),
                        ),
                        Expanded(
                          flex: 1,
                          child: textfield(Icons.format_align_left, " Ref No.",
                              reftext, refctrl, ref),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: textfield(Icons.format_align_left, " Quantity",
                              qtytext, qtyctrl, qty),
                        ),
                        SizedBox(
                          width: ScreenUtil.instance.setWidth(10),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.add_a_photo),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: textfield(Icons.format_align_left,
                              " Unit Name", unametext, unamectrl, uname),
                        ),
                        SizedBox(
                          width: ScreenUtil.instance.setWidth(10),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.bookmark_border, " Asset Remark",
                        remarktext, remarkctrl, remark),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(Icons.location_on, " Asset Location", loctext,
                        locctrl, loc),
                    SizedBox(height: ScreenUtil.instance.setHeight(20)),
                    textfield(
                        Icons.person, " Used By", usebytext, usebyctrl, useby),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget textfield(icon, text, hinttext, controller, enabled) {
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
