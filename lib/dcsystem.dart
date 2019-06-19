//import 'package:app_ui/dc_detail.dart' as prefix0;
import 'package:flutter/material.dart';
//import 'dc_detail.dart';
//import 'main.dart';
import 'package:flutter/cupertino.dart';
//import 'portalPopup.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//import 'package:autosuggest_demo/players.dart';
import 'players.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  TextEditingController controller = new TextEditingController();
  //TextEditingController prjnameCtrl = new TextEditingController();
  bool textobs = true;
  String dropdownValue;
  // static ProjectInfo weeb = new ProjectInfo('1','weeb', ['otaku', 'cancer']);
  // List <ProjectInfo> info = [weeb];
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<Players>> key = new GlobalKey();
  String prjnamehidden;
  String prjid;
  List<String> joblist = ['help', 'me', 'pls'];

  void _loadData() async {
    await PlayersViewModel.loadPlayers();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Widget build(BuildContext context) {
    double defaultScreenWidth = 1440.0;
    double defaultScreenHeight = 2960.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

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
              //searchTextField.textField.controller.text = '';
              key.currentState.clear();
            },
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: Colors.white.withOpacity(0.75),
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                      },
                    )
                  ],
                ),
                body: ListView(
                    padding: EdgeInsets.all(ScreenUtil.instance.setWidth(100)),
                    children: [
                      SizedBox(
                        height: ScreenUtil.instance.setWidth(150),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('DC System',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil.instance.setSp(150),
                                    color: Color(0xFF00b89c)))
                          ]),
                      SizedBox(
                        height: ScreenUtil.instance.setWidth(250),
                      ),
                      
                      searchTextField = AutoCompleteTextField<Players>(
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300),
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                if (prjid != null) {
                                  setState(() {
                                    prjname = prjnamehidden;
                                  });
                                  key.currentState.clear();
                                  searchTextField.textField.controller.text =
                                      prjid;
                                } else {
                                  //prjid = searchTextField.textField.controller.text;

                                }
                              },
                            ),
                            //contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                            filled: true,
                            hintText: 'Project Number',
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          suggestionsAmount: 5,
                          itemSubmitted: (item) {
                            List emptylist = [];
                            setState(() {
                              searchTextField.textField.controller.text =
                                  item.id.toString();
                              prjnamehidden = item.autocompleteterm;
                              prjid = item.id.toString();
                            });
                            key.currentState.updateSuggestions(emptylist);
                            //key.currentState.clear();
                          },
                          clearOnSubmit: false,
                          submitOnSuggestionTap: true,
                          key: key,
                          suggestions: PlayersViewModel.players,
                          itemBuilder: (context, item) {
                            return Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      item.id.toString(),
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                    ),
                                    Text(
                                      item.autocompleteterm,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ));
                          },
                          itemSorter: (a, b) {
                            return a.id.compareTo(b.id);
                          },
                          itemFilter: (item, query) {
                            return item.id
                                .toString()
                                .startsWith(query.toLowerCase());
                          }),
                      SizedBox(
                        height: ScreenUtil.instance.setHeight(75),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 20, top: 20, left: 12, right: 10),
                        child: Text(
                          '$prjname',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        decoration: new BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: new BorderRadius.all(
                                const Radius.circular(40.0))),
                      ),
                      child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(item.id.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300
                        ),),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        Text(item.autocompleteterm,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300
                        ),
                        )
                      ],
                      )
                    );
                  },
                  itemSorter: (a, b) {
                    return a.id.compareTo(b.id);
                  },
                  itemFilter: (item, query) {
                    return item.id.toString().startsWith(query.toLowerCase());
                  }
                  
                ),
                SizedBox(height: ScreenUtil.instance.setHeight(75),),
                Container(
                  padding: EdgeInsets.only(bottom: 18, top: 18, left: 12, right: 10),
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
                SizedBox(height: ScreenUtil.instance.setHeight(75),),
                Container( 
                  padding: EdgeInsets.only(bottom: 7.5, top: 7.5, left: 12, right: 10),
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(40.0)
                    )
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 35,
                              isExpanded: true,
                              value: dropdownValue,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                            //underline:,
                            hint: Text(
                              'Select a job',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black
                              ),
                              ),
                              
                              items: joblist.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text('$value')
                                  );
                              }).toList(),
                              onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                              
                            ),

                            items: joblist
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text('$value'));
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Search  ',
                                style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.w300,
                                ),
                              ),
                              Icon(Icons.search, color: Colors.white)
                            ]
                          )
                        )
                      ),
                      

                      SizedBox(
                        height: ScreenUtil.instance.setHeight(150),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/dc-system/detail');
                              },
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xFF4BA092),
                                        Color(0xFF8AD696),
                                      ],
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 35, top: 10, bottom: 10),
                                  child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                        Text(
                                          'Search  ',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Icon(Icons.search, color: Colors.white)
                                      ]))),
                            ),
                          ]),
                    ])))
      ],
    );
  }
}

class ProjectInfo {
  String prjNo;
  String prjName;
  List<String> position;

  ProjectInfo(this.prjNo, this.prjName, this.position);
}
