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
    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;

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
                  iconTheme: IconThemeData(color: Colors.white),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                      },
                    )
                  ],
                ),
                body: Center(child:Container(child:ListView(
                  physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(ScreenUtil.instance.setWidth(32)),
                    children: [
                      SizedBox(
                        height: ScreenUtil.instance.setWidth(50),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('DC System',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil.instance.setSp(35),
                                    color: Color(0xFF00b89c)))
                          ]),
                      SizedBox(
                        height: ScreenUtil.instance.setWidth(75),
                      ),
                      
                      searchTextField = AutoCompleteTextField<Players>(
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil.instance.setSp(16),
                              fontWeight: FontWeight.w300),
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Project Number',
                            hintStyle: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(16),
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.grey[600])),
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
                                          fontSize: ScreenUtil.instance.setSp(16),
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
                        height: ScreenUtil.instance.setHeight(25),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 18, top: 18, left: 10, right: 10),
                        child: Text(
                          '$prjname',
                          style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(16), fontWeight: FontWeight.w300),
                        ),
                        decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey[600]),
                            borderRadius: new BorderRadius.all(
                                Radius.circular(5.0))),
                      ),
                      SizedBox(
                        height: ScreenUtil.instance.setHeight(25),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: ScreenUtil.instance.setHeight(5), top: ScreenUtil.instance.setHeight(5), left: 12, right: 10),
                        decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey[600]),
                            borderRadius: new BorderRadius.all(
                                const Radius.circular(5.0))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 35,
                            isExpanded: true,
                            value: dropdownValue,
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(16),
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                            //underline:,
                            hint: Text(
                              'Select a job',
                              style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(16),
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
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
                      ),
                      

                      SizedBox(
                        height: ScreenUtil.instance.setHeight(100),
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
                                            fontSize: ScreenUtil.instance.setSp(21),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Icon(Icons.search, color: Colors.white)
                                      ]))),
                            ),
                          ]),
                    ])))))
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
