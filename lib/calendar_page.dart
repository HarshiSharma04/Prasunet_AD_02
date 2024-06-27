import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'add_task_for_date_page.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<String>> _tasks = {};

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    _navigateToAddTaskPage(selectedDay);
  }

  void _navigateToAddTaskPage(DateTime date) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskForDatePage(selectedDate: date),
      ),
    );

    if (result != null && result is String) {
      setState(() {
        if (_tasks[date] == null) {
          _tasks[date] = [];
        }
        _tasks[date]!.add(result);
      });
    }
  }

  void _deleteTask(DateTime date, String task) {
    setState(() {
      _tasks[date]!.remove(task);
      if (_tasks[date]!.isEmpty) {
        _tasks.remove(date);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Selected Day = " + _selectedDay.toString().split(" ")[0],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _tasks.entries.map((entry) {
                  DateTime date = entry.key;
                  List<String> tasks = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          date.toString().split(" ")[0],
                          style: TextStyle(
                            fontSize: 14, // Smaller font for the date
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...tasks.map((task) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Grey background for the task container
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            task,
                            style: TextStyle(
                              fontSize: 18, // Larger font for the task
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteTask(date, task),
                          ),
                        ),
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
