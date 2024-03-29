import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CAProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CAProjectState();
  }
}

class CAProjectState extends State<CAProject> {
  String _searchText = "";
  var data; // names we get from API
  List filteredProjects = new List(); // names filtered by search text

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var json = {
      "projects": [
        {
          "id": "00102017",
          "name": "Project 1",
          "sub": [
            {"id": "00102017", "name": "Project 1"}
          ]
        },
        {
          "id": "00102018",
          "name": "Project 2",
          "sub": [
            {"id": "00102018", "name": "Project 2"}
          ]
        },
        {
          "id": "00202017",
          "name": "Project 3",
          "sub": [
            {"id": "00202017", "name": "Project 3"}
          ]
        },
        {
          "id": "00202018",
          "name": "Project 4",
          "sub": [
            {"id": "00202018", "name": "Project 4"}
          ]
        }
      ]
    };
    data = Autogenerated.fromJson(json);
  }

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: ScreenUtil.instance.setHeight(10),
            bottom: ScreenUtil.instance.setHeight(10),
          ),
          height: ScreenUtil.instance.setHeight(60),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(15),
                      top: ScreenUtil.instance.setHeight(15)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => debugPrint('Top search tapped'),
                  ),
                  hintText: "Search...",
                  border: InputBorder.none),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: data.projects.length,
          itemBuilder: (context, i) {
            return Container(
              color: i % 2 == 0 ? Colors.white : Colors.grey[200],
              child: ExpansionTile(
                leading: Chip(
                  label: Text(data.projects[i].id),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: Color(0xFF46B5A6),
                ),
                title: Text(data.projects[i].name),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: ScreenUtil.instance.setSp(16),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/ca-menu')),
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            left: ScreenUtil.instance.setWidth(30),
                            right: ScreenUtil.instance.setWidth(30),
                          ),
                          height: ScreenUtil.instance.setHeight(40),
                          child: Container(
                            color: Colors.white,
                            child: TextField(
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () =>
                                      debugPrint('Inner search tapped'),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Search...",
                                border: OutlineInputBorder(
                                  //gapPadding: 0,
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.projects[i].sub.length,
                          itemBuilder: (context, j) {
                            return Container(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: ScreenUtil.instance.setWidth(20),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      leading: Chip(
                                        label: Text(data.projects[i].sub[j].id),
                                      ),
                                      title: Text(data.projects[i].sub[j].name),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}

class Autogenerated {
  List<Projects> projects;

  Autogenerated({this.projects});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = new List<Projects>();
      json['projects'].forEach((v) {
        projects.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  String id;
  String name;
  List<Sub> sub;

  Projects({this.id, this.name, this.sub});

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['sub'] != null) {
      sub = new List<Sub>();
      json['sub'].forEach((v) {
        sub.add(new Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.sub != null) {
      data['sub'] = this.sub.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sub {
  String id;
  String name;

  Sub({this.id, this.name});

  Sub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
