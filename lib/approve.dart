import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'approve_document.dart';
import 'approve_waiting.dart';
import 'approve_upper.dart';
import 'approve_cancel.dart';
import 'approve_manual.dart';

class Approve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ApproveState();
  }
}

class ApproveState extends State<Approve> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'APPROVE',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed('/home'),
            iconSize: 30,
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          isScrollable: true,
          unselectedLabelColor: Colors.white.withOpacity(0.3),
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(child: Text('Document')),
            Tab(child: Text('Waiting')),
            Tab(child: Text('Upper')),
            Tab(child: Text('Cancel')),
            Tab(child: Text('Manual')),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ApproveDocument(),
          ApproveWaiting(),
          ApproveUpper(),
          ApproveCancel(),
          ApproveManual()
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton.extended(
              elevation: 4.0,
              label: Container(
                child: Center(
                    child: Text(
                  'SAVE',
                  style: TextStyle(fontSize: ScreenUtil.instance.setSp(16)),
                )),
                width: ScreenUtil.instance.setWidth(80),
              ),
              onPressed: () {},
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
