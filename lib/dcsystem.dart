import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'portalPopup.dart';

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

  String prjname = 'Project Name';
  TextEditingController prjnoCtrl = new TextEditingController();
  //TextEditingController prjnameCtrl = new TextEditingController();
  bool textobs = true;
  String dropdownValue;
  static ProjectInfo weeb = new ProjectInfo('1','weeb', ['otaku', 'cancer']);
  List <ProjectInfo> info = [weeb];



 
  Widget build (BuildContext context) {
    return Stack(
      children: <Widget>[
        // Image.asset(
        //     "assets/bg_0004.jpg",
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover,
        // ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
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
          ),
          body: Container(
            padding: EdgeInsets.all(32),
            margin: EdgeInsets.only(top: 170),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
                 
              children: [
                SizedBox(height: 10,),
                // TextFormField(
                //   controller: prjnoCtrl,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                //     labelText: 'Project No.'
                //   ),

                // ),
                // SizedBox(height: 20,),
                TextFormField(
                  controller: prjnoCtrl,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    labelText: 'Project Number',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // List <String> id = info.map((prj) => prj.prjNo);
                        // String prjno = prjnoCtrl.text;
                        // if(id.contains(prjno)) {
                        //   info.forEach((work) => {
                        //     if (work.prjNo == prjno) {
                        //       setState(() {
                        //         prjname = work.prjName;
                        //       })
                        //     }
                        //   });
                        // }
                      },
                      )
                  ),

                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(bottom: 20, top: 20, left: 12, right: 10),
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
                      const Radius.circular(40.0)
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 10, left: 12, right: 10),
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(40.0)
                    )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Job',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      Container(
                        child: DropdownButton<String>(
                            iconSize: 40,
                            value: dropdownValue,
                            isExpanded: false,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()
                          )
                      )
                    ]
                  )
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/dc-detail');
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF4BA092),
                              Color(0xFF8AD696),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Search  ',
                                style: TextStyle(fontSize: 30,
                                fontWeight: FontWeight.w300,
                                ),
                              ),
                              Icon(Icons.search, color: Colors.white)
                            ]
                          )
                        )
                      ),
                    ),
                  ]
                ),
              ]
            )
          )
        ))
      ],
    );
  }
}

class ProjectInfo {
  String prjNo;
  String prjName;
  List <String> position;

  ProjectInfo(this.prjNo, this.prjName, this.position);

}