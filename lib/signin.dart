import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninL extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/home': (BuildContext context) => new MyApp()},
      theme: ThemeData(
        primaryColor: Color(0xFF00b89c),
      ),
      home: Signin(),
    );
  }
}

class Signin extends StatefulWidget {
  @override
  SigninState createState() => SigninState();
}

class SigninState extends State<Signin> {
  TextEditingController userCtrl = new TextEditingController();
  TextEditingController passCtrl = new TextEditingController();
  bool textobs = true;

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
        Image.asset(
          "assets/bg_0004.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                padding: EdgeInsets.all(ScreenUtil.instance.setWidth(64)),
                //margin: EdgeInsets.only(top: 250),
                child: ListView(children: [
                  SizedBox(height: ScreenUtil.instance.setHeight(1000)),
                  TextFormField(
                    controller: userCtrl,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter Username'),
                  ),
                  SizedBox(height: ScreenUtil.instance.setHeight(60)),
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
                        )),
                  ),
                  SizedBox(height: ScreenUtil.instance.setHeight(30)),
                  GestureDetector(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password?',
                              style: TextStyle(color: Colors.red),
                            )
                          ])),
                  SizedBox(height: ScreenUtil.instance.setHeight(100)),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route route) => false);
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
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
                          padding: const EdgeInsets.only(
                              left: 55, right: 55, top: 10, bottom: 10),
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    ),
                  ]),
                ])))
      ],
    );
  }
}
