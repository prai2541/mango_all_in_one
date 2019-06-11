import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';

class DCSysL extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00b89c),
      ),
      home: DCSys(title: 'Flutter Demo Home Page'),
    );
  }
}

class DCSys extends StatefulWidget {
  DCSys({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  DCSysState createState() => DCSysState();
}

class DCSysState extends State<DCSys> {

  String prjname = 'help';
  TextEditingController prjnoCtrl = new TextEditingController();
  TextEditingController prjnameCtrl = new TextEditingController();
  bool textobs = true;
 
  Widget build (BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
            "assets/bg_0004.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.white.withOpacity(0.8),),
          body: Container(
            padding: EdgeInsets.all(32),
            margin: EdgeInsets.only(top: 170),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
                  
              children: [
                SizedBox(height: 10,),
                TextFormField(
                  controller: prjnoCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    labelText: 'Project No.'
                  ),

                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: prjnameCtrl,
                  //keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    labelText: 'Project Name'
                  ),

                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 10),
                  child: Text(
                    '$prjname',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(40.0))),
                      
                )
              ]
            )
          )
        )
      ],
    );
  }
}