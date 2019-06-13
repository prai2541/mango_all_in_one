import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DCDetail extends StatelessWidget {


String getDate() {
  var now = new DateTime.now();
  var formatter = new DateFormat('d MMMM y');
  return formatter.format(now);
}

  @override
  Widget build(BuildContext context) {
    Widget List() {
      return Card(
        color: Colors.blue,
        child: Center(
          child: Text('LIST', style: TextStyle(color: Colors.white, fontSize: 30),),
        ),);
    }


    Widget Detail() {
      return Card(
        color: Colors.red,
        child: Center(
          child: Text('DETAIL', style: TextStyle(color: Colors.white, fontSize: 30),),
        ),);
    }


    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF00b89c),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.apps,
                  color: Colors.white.withOpacity(0.75),
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/portal');
                },
              )
            ],
            bottom: TabBar(
              indicatorColor: Color(0xFFB8001C) ,
              indicatorWeight: 3.0,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 18),
              tabs: [
                Tab(child: Text(getDate())),
                Tab(child: Text('Detail')),
              ],
            ),
            title: Text('DC SYSTEM', style: TextStyle(color: Colors.white),),
          ),
          body: TabBarView(
            children: [
              List(),
              Detail(),
            ],
          ),
        ),
      ),
    );
  }
}