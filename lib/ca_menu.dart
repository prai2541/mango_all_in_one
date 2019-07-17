import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CAMenu extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets Manager', style: TextStyle(fontFamily: 'Prompt', color: Colors.white)),
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
      body: body(context)
    );
  }

  Widget body(context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                flex: 1, child: menu('Count Assets', Icons.monetization_on)),
            Container(
                height: ScreenUtil.instance.setHeight(50),
                child: VerticalDivider(
                  width: 1,
                )),
            Expanded(
                flex: 1,
                child: menu('New Asset', Icons.add_circle, () {
                  Navigator.of(context).pushNamed('/ca-new-entry');
                }))
          ],
        ),
        Divider(
          height: 1,
        ),
        Row(
          children: <Widget>[
            Expanded(flex: 1, child: menu('Assets Report', Icons.insert_chart)),
            Container(
                height: ScreenUtil.instance.setHeight(50),
                child: VerticalDivider(
                  width: 1,
                )),
            Expanded(
                flex: 1, child: menu('Assets in the Project', Icons.add_circle))
          ],
        ),
        Divider(
          height: 1,
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: menu('Other projects Assets', Icons.monetization_on)),
            Container(
                height: ScreenUtil.instance.setHeight(50),
                child: VerticalDivider(
                  width: 1,
                )),
            Expanded(flex: 1, child: menu('Assets New', Icons.add_circle))
          ],
        ),
        //SizedBox(height: ScreenUtil.instance.setHeight(30)),
        Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: ScreenUtil.instance.setHeight(10)),
                  Text('Project :  Placeholder Name'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Documnet No. :  FAC0123456789'),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text('Remark :  Remark')
                ],
              ),
            ))
      ],
    );
  }

  Widget menu(text, icon, [f]) {
    return GestureDetector(
      onTap: f,
      child: Container(
          padding: EdgeInsets.all(20),
          color: Color(0xFF46B5A6),
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(height: ScreenUtil.instance.setHeight(10)),
              Text(
                '$text',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.instance.setSp(13)),
              )
            ],
          )),
    );
  }
}
