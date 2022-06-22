
// import 'package:compassinvest/models/trade.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Calendar extends StatefulWidget {
//   const Calendar({Key? key}) : super(key: key);

//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   late Map<DateTime, List<Trading>> selectedEvents;
//   CalendarFormat format = CalendarFormat.month;
//   DateTime selectedDay = DateTime.now();
//   DateTime focusedDay = DateTime.now();

//   final TextEditingController _eventController = TextEditingController();

//   @override
//   void initState() {
//     selectedEvents = {};
//     super.initState();
//   }

//   List<Trading> _getEventsfromDay(DateTime date) {

//     return selectedEvents[date] ?? [];
//   }

//   @override
//   void dispose() {
//     _eventController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TableCalendar(
//           focusedDay: selectedDay,
//           firstDay: DateTime(1990),
//           lastDay: DateTime(2050),
//           calendarFormat: format,
//           onFormatChanged: (CalendarFormat _format) {
//             setState(() {
//               format = _format;
//             });
//           },
//           startingDayOfWeek: StartingDayOfWeek.sunday,
//           daysOfWeekVisible: true,

//           //Day Changed
//           onDaySelected: (DateTime selectDay, DateTime focusDay) {
//             setState(() {
//               selectedDay = selectDay;
//               focusedDay = focusDay;
//             });
//             print(focusedDay);
//           },
//           selectedDayPredicate: (DateTime date) {
//             return isSameDay(selectedDay, date);
//           },

//           eventLoader: _getEventsfromDay,

//           //To style the Calendar
//           calendarStyle: CalendarStyle(
//             isTodayHighlighted: true,
//             selectedDecoration: BoxDecoration(
//               color: const Color(0xff17255A),
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//             selectedTextStyle: const TextStyle(color: Colors.white),
//             todayDecoration: BoxDecoration(
//               color: const Color(0xffCBA135),
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//             defaultDecoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//             weekendDecoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//           ),
//           headerStyle: HeaderStyle(
//             formatButtonVisible: true,
//             titleCentered: true,
//             formatButtonShowsNext: false,
//             formatButtonDecoration: BoxDecoration(
//               color: const Color(0xff17255A),
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//             formatButtonTextStyle: const TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//         ..._getEventsfromDay(selectedDay).map(
//           (Trading event) => ListTile(
//             title: Text(
//               event.link.toString(),
//             ),
//           ),
//         ),
//         FloatingActionButton.extended(
//           onPressed: () => showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: const Text("Add Event"),
//               content: TextFormField(
//                 controller: _eventController,
//               ),
//               actions: [
//                 TextButton(
//                   child: const Text("Cancel"),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 TextButton(
//                   child: const Text("Ok"),
//                   onPressed: () {
//                     if (_eventController.text.isEmpty) {
//                     } else {
//                       if (selectedEvents[selectedDay] != null) {
//                         selectedEvents[selectedDay]!.add(
//                           Trading(
//                               link: _eventController.text,
//                               type: false,
//                               date: Timestamp.now()),
//                         );
//                       } else {
//                         selectedEvents[selectedDay] = [
//                           Trade(
//                               link: _eventController.text,
//                               type: false,
//                               date: Timestamp.now()),
//                         ];
//                       }
//                     }
//                     Navigator.pop(context);
//                     _eventController.clear();
//                     setState(() {});
//                     return;
//                   },
//                 ),
//               ],
//             ),
//           ),
//           label: Text("Add Event"),
//           icon: Icon(Icons.add),
//         ),
//       ],
//     );
//   }
// }
