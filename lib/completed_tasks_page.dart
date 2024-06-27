import 'package:flutter/material.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<String> completedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
      ),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(completedTasks[index]),
            ),
          );
        },
      ),
    );
  }
}
