import 'package:flutter/material.dart';
import 'approve_document.dart';
import 'approve_waiting.dart';
import 'approve_upper.dart';
import 'approve_cancel.dart';
import 'approve_manual.dart';

class Approve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
            labelColor: Colors.white,
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(child: Text('Document')),
              Tab(child: Text('Waitng')),
              Tab(child: Text('Upper')),
              Tab(child: Text('Cancel')),
              Tab(child: Text('Manual')),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ApproveDocument(),
            ApproveWaiting(),
            ApproveUpper(),
            ApproveCancel(),
            ApproveManual()
          ],
        ),
      ),
    );
  }
}
