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
import 'PRcon.dart';

class PRmainL extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00b89c),
      ),
      home: PRmain(title: 'Flutter Demo Home Page'),
      routes: {
        '/pr-main/con' : (BuildContext context) => new PRcontinueL()
      },
    );
  }
}

class PRmain extends StatefulWidget {
  PRmain({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  PRmainState createState() => PRmainState();
}

class PRmainState extends State<PRmain>{

  //String prjname = 'Project Name';
  TextEditingController pcodectrl = new TextEditingController();
  TextEditingController jcodectrl = new TextEditingController();
  TextEditingController dcodectrl = new TextEditingController();
  
  //String dropdownValue;
  
  AutoCompleteTextField prjcode;
  AutoCompleteTextField jobcode;
  AutoCompleteTextField depcode;
  GlobalKey<AutoCompleteTextFieldState<Players>> key1 = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Players>> key2 = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Players>> key3 = new GlobalKey();
  //String prjnamehidden;
  //String prjid;
  String prjnum;
  String jobnum;
  String depnum;
  
 
  


  void _loadData() async {
    await PlayersViewModel.loadPlayers();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
    //tctrl =TabController(vsync: this, length: 2);
  }

  Widget createAutoComField(textctrl, hint, gkey, field) {
    return AutoCompleteTextField<Players>(
                  style: new TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w300),
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // if(prjnum != null) {
                        //   setState(() {
                        //    textctrl.text = field; 
                        //   });
                        //   gkey.currentState.clear();
                        //   //textctrl.text = prjid;
                        // } else{
                        //   //prjid = searchTextField.textField.controller.text;
                          
                        // }
                        
                      },
                    ),
                    //contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    filled: true,
                    hintText: '$hint',
                    hintStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black
                        ),
                  ),
                  suggestionsAmount: 5,
                  itemSubmitted: (item) {
                    // List emptylist = [];
                    // setState(() {
                    //   //textctrl.text = item.id.toString();
                    //   //prjnamehidden = item.autocompleteterm;
                    //   //prjid = item.id.toString();
                    // });  
                    // gkey.currentState.updateSuggestions(emptylist);
                    // //key.currentState.clear();
                  },
                  clearOnSubmit: false,
                  submitOnSuggestionTap: true,
                  key: gkey,
                  suggestions: PlayersViewModel.players,
                  itemBuilder: (context, item) {
                    // return Container(
                    //   padding: EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(20))
                    //   ),
                    //   child:Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     Text(item.id.toString(),
                    //     style: TextStyle(
                    //       fontSize: 18.0,
                    //       fontWeight: FontWeight.w300
                    //     ),),
                    //     Padding(
                    //       padding: EdgeInsets.all(15.0),
                    //     ),
                    //     Text(item.autocompleteterm,
                    //     style: TextStyle(
                    //       fontSize: 18.0,
                    //       fontWeight: FontWeight.w300
                    //     ),
                    //     )
                    //   ],
                    //   )
                    // );
                  },
                  itemSorter: (a, b) {
                    //return a.id.compareTo(b.id);
                  },
                  itemFilter: (item, query) {
                    //return item.id.toString().startsWith(query.toLowerCase());
                  }
                  
                );
  }


  Widget createPR() {

    double defaultScreenWidth = 1440.0;
    double defaultScreenHeight = 2960.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);
    return ListView(
            padding: EdgeInsets.all(ScreenUtil.instance.setWidth(100)),
              children: [
                prjcode = createAutoComField(pcodectrl, 'Project code', key1, prjnum),
                SizedBox(height: ScreenUtil.instance.setHeight(75),),
                jobcode = createAutoComField(jcodectrl, 'Job code', key2, jobnum),
                SizedBox(height: ScreenUtil.instance.setHeight(75),),
                depcode = createAutoComField(dcodectrl, 'Department code', key3, depnum),
                SizedBox(height: ScreenUtil.instance.setHeight(150),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/pr-main/con');               
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
                                'Continue',
                                style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.w300,
                                ),
                              ),
                              //Icon(Icons.search, color: Colors.white)
                            ]
                          )
                        )
                      ),
                    ),
                  ]
                ),
              ]
            );
  }
  



 
 Widget build(BuildContext context) {

    double defaultScreenWidth = 1440.0;
    double defaultScreenHeight = 2960.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              title: Text(
                'PR',
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
                      SizedBox(height: ScreenUtil.instance.setWidth(100),),
                      Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Purchase', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.instance.setSp(150), color: Color(0xFF00b89c))), Text('Requisition', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.instance.setSp(150), color: Color(0xFF00b89c)))]),
                      SizedBox(height: ScreenUtil.instance.setWidth(150),),
                      
                    ],
                  ),
                ),
                TabBar(
                        indicatorColor: Color(0xFFB8001C),
                        indicatorWeight: 3.0,
                        labelColor: Color(0xFFB8001C),
                        labelStyle: TextStyle(fontSize: 18),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(child: Text('CREATE')),
                          Tab(child: Text('STATUS')),
                        ],
                      ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[createPR(), Center(child: Text('PLACEHOLDER STATUS', style: TextStyle(fontSize: 40),),)],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class ProjectInfo {
  String prjNo;
  String prjName;
  List <String> position;

  ProjectInfo(this.prjNo, this.prjName, this.position);

}

