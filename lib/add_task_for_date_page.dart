import 'package:flutter/material.dart';

class AddTaskForDatePage extends StatelessWidget {
  final DateTime selectedDate;

  AddTaskForDatePage({required this.selectedDate});

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task for ${selectedDate.toString().split(" ")[0]}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _taskController.text);
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
