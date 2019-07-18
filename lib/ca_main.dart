import 'package:app_ui/ca_dapartment.dart';
import 'package:app_ui/ca_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountAssetsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home', (Route<dynamic> route) => false),
              )
            ],
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Count Assets',
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorWeight: 3,
              labelStyle: TextStyle(fontSize: ScreenUtil.instance.setSp(18)),
              // indicatorColor: Color(0xFFB54655),
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Project',
                  ),
                ),
                Tab(
                  child: Text(
                    'Department',
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              CAProject(),
              CADepartment(),
            ],
          ),
        ),
      ),
    );
  }
}
