import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaterialObj {
  String matcode;
  String matname;
  int qty;
  int unit;
  int ppn;

  MaterialObj({this.matcode, this.matname, this.qty, this.unit, this.ppn});

  factory MaterialObj.fromJson(Map<String, dynamic> parsedJson) {
    return MaterialObj(
        matname: parsedJson['matname'] as String,
        qty: parsedJson['qty'],
        matcode: parsedJson['qty'],
        unit: parsedJson['qty'],
        ppn: parsedJson['qty'],
        
    );
  }
}
class MatViewModel {
  static List<MaterialObj> matlist;

  static Future loadMat() async {
    try {
      matlist = new List<MaterialObj>();
      String jsonString = await rootBundle.loadString('assets/mat.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson[''] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        matlist.add(new MaterialObj.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}