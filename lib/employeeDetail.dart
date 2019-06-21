import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

var events = {
      new DateTime(2019, 6, 4): [
        new Event(
          date: new DateTime(2019, 6, 4),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 5): [
        new Event(
          date: new DateTime(2019, 6, 5),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 6): [
        new Event(
          date: new DateTime(2019, 6, 6),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 7): [
        new Event(
          date: new DateTime(2019, 6, 7),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 10): [
        new Event(
          date: new DateTime(2019, 6, 10),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 11): [
        new Event(
          date: new DateTime(2019, 6, 11),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 12): [
        new Event(
          date: new DateTime(2019, 6, 12),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 13): [
        new Event(
          date: new DateTime(2019, 6, 13),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 14): [
        new Event(
          date: new DateTime(2019, 6, 14),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 17): [
        new Event(
          date: new DateTime(2019, 6, 17),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 18): [
        new Event(
          date: new DateTime(2019, 6, 18),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 19): [
        new Event(
          date: new DateTime(2019, 6, 19),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 20): [
        new Event(
          date: new DateTime(2019, 6, 20),
          title: 'Event 1',
        )
      ],
    };

class EmployeeDetail extends StatelessWidget {
  String name;
  String telephone = '081-234-5678';
  int dayofwork;

  EmployeeDetail(this.name);

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 375.0;
    double defaultScreenHeight = 812.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(ScreenUtil.instance.setHeight(260)),
              child: AppBar(
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white.withOpacity(0.75),
                      size: 30.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (Route<dynamic> route) => false);
                    },
                  )
                ],
                title: Text('Working History'),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(
                          top: ScreenUtil.instance.setHeight(100),
                          left: ScreenUtil.instance.setWidth(10),
                          right: ScreenUtil.instance.setWidth(10)),
                      child: Container(
                        // padding: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: ScreenUtil.instance.setHeight(60),
                                    backgroundImage: NetworkImage(
                                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/25e384a9-c599-45c5-bc56-929c3111276c/d6k8a2r-3391ff86-4af8-4695-bfad-14350ae04bfe.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI1ZTM4NGE5LWM1OTktNDVjNS1iYzU2LTkyOWMzMTExMjc2Y1wvZDZrOGEyci0zMzkxZmY4Ni00YWY4LTQ2OTUtYmZhZC0xNDM1MGFlMDRiZmUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Bx0q3W1dS8p6f8DSiUCPrjHzt4LWxhJQw0d3k0Qz06Q'),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '$name',
                                    style: TextStyle(
                                        fontSize: ScreenUtil.instance.setSp(20),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Working Day : ${events.length} Days',
                                      style: TextStyle(
                                          fontSize:
                                              ScreenUtil.instance.setSp(16))),
                                  Text('Tel. $telephone',
                                      style: TextStyle(
                                          fontSize:
                                              ScreenUtil.instance.setSp(16)))
                                ],
                              )
                            ]),
                      )),
                ),
                backgroundColor: Color(0xFF46B5A6),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            body: WorkingCalendar1()));
  }
}

class WorkingCalendar1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkingCalendar1State();
  }
}

class WorkingCalendar1State extends State<WorkingCalendar1> {

  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = '';

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: events
  );

  CalendarCarousel _calendarCarousel;

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      selectedDayButtonColor: Colors.blue,
      selectedDayTextStyle: TextStyle(color: Colors.white),
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      markedDateShowIcon: true,
      markedDateIconBuilder: ((event) => CircleAvatar(
        backgroundColor: Colors.green,
        child: Text('${event.date.day}', style: TextStyle(color: Colors.white, fontSize: ScreenUtil.instance.setSp(16))),
        
      )),

//          weekDays: null, /// for pass null when you do not want to render weekDays
//          headerText: Container( /// Example for rendering custom header
//            child: Text('Custom Header'),
//          ),
//          markedDates: _markedDate,
      markedDatesMap: _markedDateMap,
      selectedDateTime: _currentDate2,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateMoreShowTotal:
          false, // null for not showing hidden events indicator
      onCalendarChanged: (DateTime date) {
        this.setState(() => _currentMonth = DateFormat.yMMM().format(date));
      },
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
    );

    return Container(
        // margin: EdgeInsets.only(top: 10),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: _calendarCarousel));
  }
}