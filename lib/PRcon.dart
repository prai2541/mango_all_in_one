import 'package:app_ui/PRadd.dart';
import 'package:app_ui/players.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PRcontinueL extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00b89c),
      ),
      home: PRcontinue(title: 'Flutter Demo Home Page'),
      routes: {
        '/pr-add' : (BuildContext context) => new PRAdd(),
         
      },
      
    );
  }
}

class PRcontinue extends StatefulWidget {
  PRcontinue({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  PRcontinueState createState() => PRcontinueState();
}

class PRcontinueState extends State<PRcontinue>{

  TextEditingController supctrl = TextEditingController();
  TextEditingController delctrl = TextEditingController();
  Widget sup;
  Widget del;
  GlobalKey<AutoCompleteTextFieldState<Players>> key1 = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<Players>> key2 = new GlobalKey();
  DateTime selectedDate;


  Widget createAutoComField(textctrl, hint, key) {
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
                  key: key,
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

  Future<Null> _selectDate(BuildContext context) async {
    selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget datepicker() {
    if(selectedDate == null) {
      return Container(
                  padding: EdgeInsets.only(bottom: 8, top: 8, left: 12, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(
                    'Select delivery date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                    ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    )
                  ]),
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(40.0)
                    )
                  ),
                );
    } else {
      var unix = selectedDate;
      var date = '${unix.day}/${unix.month}/${unix.year}';
      return Container(
                  padding: EdgeInsets.only(bottom: 8, top: 8, left: 12, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(
                    '$date',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                    ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    )
                  ]),
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(40.0)
                    )
                  ),
                );
    }
  }


  Widget build(BuildContext context) {

    double defaultScreenWidth = 1440.0;
    double defaultScreenHeight = 2960.0;
    
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
   )..init(context);

    return Scaffold(
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
      body:Container(
        margin: EdgeInsets.all(ScreenUtil.instance.setWidth(100)),
        child:ListView(
          children: <Widget>[
            SizedBox(height: ScreenUtil.instance.setHeight(50),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('PURCHASE', 
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(110), 
                      fontWeight: FontWeight.w700, 
                      color: Color(0xFF00b89c)
                      )
                    ),
                    Text('REQUISITION', 
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(110), 
                      fontWeight: FontWeight.w700, 
                      color: Color(0xFF00b89c)
                      )
                    ),
                  ]
                )
              ]
            ),
            SizedBox(height: ScreenUtil.instance.setHeight(200),),
            sup = createAutoComField(supctrl, 'Supplier', key1),
            SizedBox(height: ScreenUtil.instance.setHeight(100),),
            del = createAutoComField(supctrl, 'Delivery Place', key2),
            SizedBox(height: ScreenUtil.instance.setHeight(100),),
            datepicker(),
            SizedBox(height: ScreenUtil.instance.setHeight(200),),
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/pr-add');               
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
            SizedBox(height: ScreenUtil.instance.setHeight(100),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text('Skip', style: TextStyle(color: Colors.grey, fontSize: 20, decoration: TextDecoration.underline),),
                  onTap: () {

                  },
                ),

              ],
            )
            
            


          ],
        )
      )
    );
  }

}