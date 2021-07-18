import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sian/widgets/custom_app_bar.dart';
import 'package:sian/widgets/model/event.dart';
import 'package:flutter/material.dart';
import 'package:sian/widgets/reward_point.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarScreen> {
  Map<DateTime, List<Event>>? selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  var rewardPoint;

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents?[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff222831),
      // appBar: AppBar(
      //   title: Text(
      //     "Travel Planner",
      //     style: GoogleFonts.poppins(
      //       color: Color(0xff393e46),
      //       fontSize: 25,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      //   centerTitle: true,
      //   toolbarHeight: 70 / 812 * height,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Color(0xffeeeeee),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(30),
      //       bottomRight: Radius.circular(30),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.09,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: Color(0xffeeeeee),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Travel Planner",
                        style: GoogleFonts.poppins(
                          color: Color(0xff393e46),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: Icon(
                            FontAwesomeIcons.signOutAlt,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (route) => false);
                        },
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 47, 0, 47),
                child: TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  // onFormatChanged: (CalendarFormat _format) {
                  //   setState(() {
                  //     format = _format;
                  //   });
                  // },
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  daysOfWeekVisible: true,

                  //Day Changed
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                    });
                    print(focusedDay);
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },

                  eventLoader: _getEventsfromDay,

                  //To style the Calendar
                  calendarStyle: CalendarStyle(
                    markerDecoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: GoogleFonts.poppins(color: Colors.white),
                    holidayTextStyle: GoogleFonts.poppins(color: Colors.red),
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),

                  headerStyle: HeaderStyle(
                    titleTextStyle: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                    leftChevronIcon: Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.white,
                      size: 15,
                    ),
                    rightChevronIcon: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.white,
                      size: 15,
                    ),
                    formatButtonVisible: true,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: Color(0xff00adb5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    formatButtonTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: width,
                height: 287 / 812 * height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                  color: Color(0xffeeeeee),
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Travel Plans",
                          style: GoogleFonts.poppins(
                            color: Color(0xff393e46),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 100 / 812 * height,
                          child: ListView(
                            children: [
                              ..._getEventsfromDay(selectedDay).map(
                                (Event event) => ListTile(
                                  title: Text(
                                    event.title,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                    ),
                                  ),
                                  leading: Icon(
                                    FontAwesomeIcons.calendar,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 193 / 375 * width,
                          height: 58 / 812 * height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Color(0xff00adb5),
                          ),
                          child: InkWell(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Add Event"),
                                content: TextFormField(
                                  controller: _eventController,
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  TextButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      if (_eventController.text.isEmpty) {
                                      } else {
                                        if (selectedEvents?[selectedDay] !=
                                            null) {
                                          selectedEvents?[selectedDay]!.add(
                                            Event(title: _eventController.text),
                                          );
                                        } else {
                                          selectedEvents?[selectedDay] = [
                                            Event(title: _eventController.text)
                                          ];
                                        }
                                      }
                                      Navigator.pop(context);
                                      _eventController.clear();
                                      setState(() {});
                                      return;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Add Event",
                                  style: TextStyle(
                                    color: Color(0xffeeeeee),
                                    fontSize: 20,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.plusCircle,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: Text("Add Event"),
      //       content: TextFormField(
      //         controller: _eventController,
      //       ),
      //       actions: [
      //         TextButton(
      //           child: Text("Cancel"),
      //           onPressed: () => Navigator.pop(context),
      //         ),
      //         TextButton(
      //           child: Text("Ok"),
      //           onPressed: () {
      //             if (_eventController.text.isEmpty) {
      //             } else {
      //               if (selectedEvents?[selectedDay] != null) {
      //                 selectedEvents?[selectedDay]!.add(
      //                   Event(title: _eventController.text),
      //                 );
      //               } else {
      //                 selectedEvents?[selectedDay] = [
      //                   Event(title: _eventController.text)
      //                 ];
      //               }
      //             }
      //             Navigator.pop(context);
      //             _eventController.clear();
      //             setState(() {});
      //             return;
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      //   label: Text("Add Event"),
      //   icon: Icon(Icons.add),
      // ),
    );
  }
}
