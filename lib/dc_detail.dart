import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List<String> name = [
  "Satsawat Suttawuttiwong",
  'Boonsita Vatcharakomonphan',
  'Akekamon Boonsith',
  'Tanapong Tetiranont'
];
List<String> status = ["DONE", "ADD", "ADD", "DONE"];

class DCDetail extends StatelessWidget {
  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('d MMMM y');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
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
                indicatorColor: Color(0xFFB8001C),
                indicatorWeight: 3.0,
                labelColor: Color(0xFFB8001C),
                labelStyle: TextStyle(fontSize: 18),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(child: Text(getDate().toUpperCase())),
                  Tab(child: Text('DETAIL')),
                ],
              ),
              title: Text(
                'DC SYSTEM',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.black.withOpacity(0.08),
                  padding: EdgeInsets.only(top: 30, bottom: 30, left: 20),
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        'Project : 202019',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Project Name : Center Store',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Job : CML',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Inspector : Mr.Inspector',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[ListTabView(), DetailTabView()],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class ListTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListTabViewState();
  }
}

class _ListTabViewState extends State<ListTabView> {
  Color colorStatus(String status) {
    switch (status) {
      case 'DONE':
        {
          return Color(0xFF42957c);
        }
        break;

      case 'ADD':
        {
          return Color(0xFFf6ca6b);
        }
    }
  }

  Color textColor(String status) {
    switch (status) {
      case 'DONE':
        {
          return Color(0xFF66c1a9);
        }
        break;

      case 'ADD':
        {
          return Color(0xFFf6cb6f);
        }
    }
  }

  Future<void> _deleteAlert(index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Would you like to delete this data?'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'YES',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  name.removeAt(index);
                  status.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
                child: Text(
                  'NO',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );

        // return AlertDialog(
        //   title: Text('Would you like to delete this data?'),
        //   actions: <Widget>[
        //     FlatButton(
        //       child: Text('YES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        //       onPressed: () {
        //         setState(() {
        //           name.removeAt(index);
        //           status.removeAt(index);
        //         });
        //         Navigator.of(context).pop();
        //       },
        //     ),
        //     FlatButton(
        //       child: Text('NO', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       }
        //     )
        //   ],
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return Slidable(
            actionExtentRatio: 0.25,
            actionPane: SlidableDrawerActionPane(),
            child: Card(
                child: ListTile(
              contentPadding: EdgeInsets.only(right: 20),
              leading: Container(
                width: 10,
                color: colorStatus(status[i]),
              ),
              title: Text(name[i]),
              trailing: Text(
                status[i],
                style: TextStyle(color: textColor(status[i])),
              ),
            )),
            secondaryActions: <Widget>[
              IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    _deleteAlert(i);
                  })
            ],
          );
        });
  }
}

class DetailTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailTabViewState();
  }
}

class _DetailTabViewState extends State<DetailTabView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
    );
  }
}
