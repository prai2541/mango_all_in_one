import 'package:app_ui/count_assets_dapartment.dart';
import 'package:app_ui/count_assets_project.dart';
import 'package:flutter/material.dart';

class CountAssetsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Count Assets',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Project',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Department',
                  style: TextStyle(color: Colors.white),
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
    );
  }
}
