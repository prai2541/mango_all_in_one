import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CADepartment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, i) {
        return Container(
          color: i % 2 == 0 ? Colors.white : Colors.grey[200],
          child: ListTile(
            leading: Chip(
              backgroundColor: Colors.blue,
              label: Text('AC'),
              labelStyle: TextStyle(color: Colors.white),
            ),
            title: Text('Department $i'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: ScreenUtil.instance.setSp(16),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
