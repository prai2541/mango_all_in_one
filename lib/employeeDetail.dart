import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EmployeeDetail extends StatelessWidget {
  String name;
  String telephone = '081-234-5678';
  int dayofwork;

  EmployeeDetail(this.name);

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 1125.0;
    double defaultScreenHeight = 2436.0;

    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);


    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil.instance.setHeight(795)),
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
            title: Center(child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(top: ScreenUtil.instance.setHeight(405), left: ScreenUtil.instance.setWidth(40), right: ScreenUtil.instance.setWidth(40)),
            child: Container(
              // padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     CircleAvatar(
                       radius: ScreenUtil.instance.setHeight(160),
                       backgroundImage: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/25e384a9-c599-45c5-bc56-929c3111276c/d6k8a2r-3391ff86-4af8-4695-bfad-14350ae04bfe.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI1ZTM4NGE5LWM1OTktNDVjNS1iYzU2LTkyOWMzMTExMjc2Y1wvZDZrOGEyci0zMzkxZmY4Ni00YWY4LTQ2OTUtYmZhZC0xNDM1MGFlMDRiZmUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Bx0q3W1dS8p6f8DSiUCPrjHzt4LWxhJQw0d3k0Qz06Q'),
                     )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$name',
                        style: TextStyle(fontSize: ScreenUtil.instance.setSp(65), fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Working Day : 5 Days',
                        style: TextStyle(fontSize: ScreenUtil.instance.setSp(40))
                      ),
                      Text('Tel. $telephone',
                      style: TextStyle(fontSize: ScreenUtil.instance.setSp(40))
                      )
                    ],
                  )
                ]
                
              ),
            )
          ),),
          ),
          backgroundColor: Color(0xFF46B5A6),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),),
        body: WorkingCalendar(name, telephone)  
        )
    );
  }
}

class WorkingCalendar extends StatefulWidget {
  String name;
  String telephone;
  WorkingCalendar(this.name, this.telephone);

  @override
  State<StatefulWidget> createState() {
    return WorkingCalendarState(name, telephone);
  }
}

class WorkingCalendarState extends State<WorkingCalendar> {
  String name;
  String telephone;

  WorkingCalendarState(this.name, this.telephone);
  
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = '';
  
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 6, 15): [
        new Event(
          date: new DateTime(2019, 2, 15),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 16): [
        new Event(
          date: new DateTime(2019, 2, 16),
          title: 'Event 1',
        )
      ],
      new DateTime(2019, 6, 17): [
        new Event(
          date: new DateTime(2019, 2, 17),
          title: 'Event 1',
        )
      ],
    },
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

//          weekDays: null, /// for pass null when you do not want to render weekDays
//          headerText: Container( /// Example for rendering custom header
//            child: Text('Custom Header'),
//          ),
//          markedDates: _markedDate,
      markedDatesMap: _markedDateMap,
      selectedDateTime: _currentDate2,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateMoreShowTotal: false, // null for not showing hidden events indicator
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
        child: _calendarCarousel
      )
);
  }
}
