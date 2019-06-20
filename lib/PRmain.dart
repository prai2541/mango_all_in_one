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
//import 'PRcon.dart';

class PRmainL extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PRmain(title: 'Flutter Demo Home Page'),
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
  
  // AutoCompleteTextField prjcode;
  // AutoCompleteTextField jobcode;
  // AutoCompleteTextField depcode;
  // GlobalKey<AutoCompleteTextFieldState<Players>> key1 = new GlobalKey();
  // GlobalKey<AutoCompleteTextFieldState<Players>> key2 = new GlobalKey();
  // GlobalKey<AutoCompleteTextFieldState<Players>> key3 = new GlobalKey();
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

  Widget createAutoComField(textctrl, hint) {
    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);
    return TextFormField(
      controller: textctrl,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: ScreenUtil.instance.setSp(16)
      ),
      decoration: InputDecoration(
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey[600])
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {

          },
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: ScreenUtil.instance.setSp(16)
        )
      ),
    );
  }


  Widget createPR() {

    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);
    return Center(child:Container(child:ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(20), left: ScreenUtil.instance.setWidth(32), right: ScreenUtil.instance.setWidth(32)),
            shrinkWrap: true,
              children: [
                createAutoComField(pcodectrl, 'Project code'),
                SizedBox(height: ScreenUtil.instance.setHeight(20),),
                createAutoComField(jcodectrl, 'Job code'),
                SizedBox(height: ScreenUtil.instance.setHeight(20),),
                createAutoComField(dcodectrl, 'Department code'),
                SizedBox(height: ScreenUtil.instance.setHeight(40),),
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
                        padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(35), right: ScreenUtil.instance.setWidth(35), top: ScreenUtil.instance.setHeight(10), bottom: ScreenUtil.instance.setHeight(10)),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Continue',
                                style: TextStyle(fontSize: ScreenUtil.instance.setSp(25),
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
            )));
  }
  



 
 Widget build(BuildContext context) {

    double defaultScreenWidth = 412.0;
    double defaultScreenHeight = 846.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);

    return DefaultTabController(
        length: 2,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            
          },
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: ScreenUtil.instance.setSp(30),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  })
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
                  padding: EdgeInsets.only(top: ScreenUtil.instance.setHeight(30), bottom: ScreenUtil.instance.setHeight(30), left: 0),
                  child: ListBody(
                    
                    children: <Widget>[
                      SizedBox(height: ScreenUtil.instance.setWidth(30),),
                      Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Purchase', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.instance.setSp(40), color: Color(0xFF00b89c))), Text('Requisition', style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil.instance.setSp(40), color: Color(0xFF00b89c)))]),
                      SizedBox(height: ScreenUtil.instance.setWidth(30),),
                      
                    ],
                  ),
                ),
                TabBar(
                        indicatorColor: Color(0xFFB8001C),
                        indicatorWeight: 3.0,
                        labelColor: Color(0xFFB8001C),
                        labelStyle: TextStyle(fontSize: ScreenUtil.instance.setSp(18)),
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
            ))),
    );
  }
}

class ProjectInfo {
  String prjNo;
  String prjName;
  List <String> position;

  ProjectInfo(this.prjNo, this.prjName, this.position);

}

