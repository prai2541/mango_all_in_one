import 'package:flutter/material.dart';

class SigninL extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00b89c),
      ),
      home: Signin(title: 'Flutter Demo Home Page'),
    );
  }
}

class Signin extends StatefulWidget {
  Signin({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  SigninState createState() => SigninState();
}

class SigninState extends State<Signin> {
 
  TextEditingController userCtrl = new TextEditingController();
  TextEditingController passCtrl = new TextEditingController();
  bool textobs = true;
 
  Widget build (BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Container(
            padding: EdgeInsets.all(32),
            margin: EdgeInsets.only(top: 350),
            child: Column(
              
              children: [
                TextFormField(
                  controller: userCtrl,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter Username'
                    
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: passCtrl,
                  obscureText: textobs,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    hintText: 'Enter Password',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                         textobs = !textobs; 
                        });
                      },
                    )
                    
                  ),
                ),
                SizedBox(height: 50),
                RaisedButton(
                  onPressed: () {},
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
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.w300,
                      ),
                    )
                  ),
                ),
              ]
            )
          )
        )
      ],
    );
  }
}