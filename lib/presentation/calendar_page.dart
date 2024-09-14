import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final DateTime _today = DateTime.now();
  bool _isYearView = false;

  List<Widget> _buildYearCalendar() {
    List<Widget> monthWidgets = List.generate(12, (index) {
      DateTime firstDayOfMonth = DateTime(_focusedDay.year, index + 1, 1);
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              DateFormat.MMMM('ru').format(firstDayOfMonth),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TableCalendar(
            availableGestures: AvailableGestures.none,
            pageAnimationEnabled: false,
            headerVisible: false,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: firstDayOfMonth,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _isYearView = false;
              });
            },
            calendarFormat: CalendarFormat.month,
            availableCalendarFormats: const {CalendarFormat.month: ''},
            calendarStyle: CalendarStyle(
              todayDecoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      );
    });
    return monthWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _focusedDay = _today;
                _selectedDay = _today;
              });
            },
            child: const Text(
              "Сегодня",
              style: TextStyle(color: Colors.orange),
            ),
          ),
          IconButton(
            icon: Icon(
                _isYearView ? Icons.calendar_view_month : Icons.calendar_month),
            onPressed: () {
              setState(() {
                _isYearView = !_isYearView;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _isYearView
            ? SingleChildScrollView(
                child: Column(
                  children: _buildYearCalendar(),
                ),
              )
            : Column(
                children: [
                  Text(
                    DateFormat.MMMM('ru').format(DateTime(2024, 9)),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TableCalendar(
                    headerVisible: false,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                    ),
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Месяц',
                    },
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
      ),
    );
  }
}
