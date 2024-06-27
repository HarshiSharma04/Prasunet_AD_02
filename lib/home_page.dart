import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Index for the selected tab
  Color _hoverColor = Colors.transparent; // Initial hover color

  List<String> tasks = ['Task 1', 'Task 2', 'Task 3']; // Example tasks list

  void _addTask() async {
    // Navigate to AddTaskPage and wait for a result
    final newTask = await Navigator.of(context).pushNamed('/add-task');
    if (newTask != null && newTask is String) {
      setState(() {
        tasks.add(newTask); // Add the new task to the list
      });
    }
  }

  void _navigateToCompletedTasks() {
    Navigator.of(context).pushNamed('/completed-tasks');
  }

  void _navigateToCategories() {
    Navigator.of(context).pushNamed('/categories');
  }

  void _navigateToSettings() {
    Navigator.of(context).pushNamed('/settings');
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TaskEase',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF5C415D),
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your asset image path
            ),
            onPressed: () {
              // Navigate to profile page or show profile options
              // For example, Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(tasks[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _removeTask(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: MouseRegion(
        onHover: (event) {
          setState(() {
            _hoverColor = Color(0xFF5C415D); // Set hover color
          });
        },
        onExit: (event) {
          setState(() {
            _hoverColor = Colors.transparent; // Reset to transparent when not hovered
          });
        },
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // Navigate to respective pages based on index
              switch (index) {
                case 0:
                // Tasks page (current page)
                  break;
                case 1:
                  _navigateToCategories(); // Navigate to Categories
                  break;
                case 2:
                  _navigateToSettings(); // Navigate to Settings
                  break;
                case 3:
                // Navigate to Calendar (add your navigation logic)
                  break;
              }
            });
          },
          selectedIconTheme: IconThemeData(color: Color(0xFF5C415D)), // Color for selected icons
          unselectedIconTheme: IconThemeData(color: Colors.grey), // Color for unselected icons
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Color(0xFF5C415D), // Selected item color
          unselectedItemColor: Colors.grey, // Unselected item color
          backgroundColor: _hoverColor, // Background color changes on hover
        ),
      ),
    );
  }
}
