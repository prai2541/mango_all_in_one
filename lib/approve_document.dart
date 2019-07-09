import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final SlidableController slidableController = SlidableController();

class ApproveDocument extends StatelessWidget {
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
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(10)),
            child: ListView(
              children: <Widget>[
                slidableList('PRM20190708', '157,875', '', 'none', context),
                Divider(height: 0),
                slidableList('PRM20190708', '157,875', '', 'none', context),
                Divider(height: 0),
                slidableList('PRM20190708', '157,875', '', 'none', context),
                Divider(height: 0),
              ],
            ),
          ),
        ),
        //
      ],
    );
  }

  Widget slidableList(String title, String amount, String remark, String status,
      BuildContext context) {
    return Slidable(
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.175,
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed('/approve-detail'),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title),
            SizedBox(
              width: ScreenUtil.instance.setWidth(10),
            ),
            Badge(
              toAnimate: false,
              shape: BadgeShape.square,
              borderRadius: 10,
              padding: EdgeInsets.only(
                  left: ScreenUtil.instance.setWidth(5),
                  right: ScreenUtil.instance.setWidth(5)),
              badgeContent: Text('PR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.instance.setSp(12))),
              badgeColor: Colors.blue,
            )
          ],
        ),
        subtitle: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Amount : $amount',
                style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
              ),
              Text(
                'Remark : $remark',
                style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
              ),
              Text(
                'Status : $status',
                style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
              )
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Date : 14/08/19',
              style: TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
            ),
            Expanded(
              child: InkWell(
                onTap: () => debugPrint('Button tapped'),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(5),
                      right: ScreenUtil.instance.setWidth(5)),
                  margin:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'File',
                        style:
                            TextStyle(fontSize: ScreenUtil.instance.setSp(12)),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('1',
                            style: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(10),
                                color: Colors.white)),
                        radius: ScreenUtil.instance.setSp(8),
                      ),
                      Icon(
                        Icons.folder,
                        size: ScreenUtil.instance.setSp(15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        costAction(),
        loopAction(),
      ],
      secondaryActions: <Widget>[
        approveAction(),
        rejectAction(),
        remarkAction(),
      ],
    );
  }

  IconSlideAction costAction() {
    return IconSlideAction(
      icon: Icons.attach_money,
      caption: 'Cost',
      color: Colors.grey,
      onTap: () {},
    );
  }

  IconSlideAction loopAction() {
    return IconSlideAction(
      icon: Icons.refresh,
      caption: 'Loop',
      color: Colors.blue,
      onTap: () {},
    );
  }

  IconSlideAction approveAction() {
    return IconSlideAction(
      icon: Icons.check,
      caption: 'Approve',
      color: Colors.green,
      onTap: () {},
    );
  }

  IconSlideAction rejectAction() {
    return IconSlideAction(
      icon: Icons.clear,
      caption: 'Reject',
      color: Colors.red,
      onTap: () {},
    );
  }

  IconSlideAction remarkAction() {
    return IconSlideAction(
      icon: Icons.edit,
      caption: 'Remark',
      color: Colors.grey,
      onTap: () {},
    );
  }
}
