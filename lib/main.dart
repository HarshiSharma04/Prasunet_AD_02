import 'package:flutter/material.dart';
import 'package:to_do_list/settings_page.dart';
import 'add_task_page.dart';
import 'categories_page.dart';
import 'completed_tasks_page.dart';
import 'home_page.dart';
import 'splash_screen.dart';
import 'calendar_page.dart';
import 'add_task_for_date_page.dart';// Import your calendar page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => SplashScreen(), // Splash screen as initial route
        '/home': (context) => TodoListApp(), // Main app content
        '/add-task': (context) => AddTaskPage(),
        '/completed-tasks': (context) => CompletedTasksPage(),
        '/categories': (context) => CategoriesPage(),
        '/settings': (context) => SettingsPage(),
        '/calendar': (context) => CalendarPage(),

      },
    );
  }
}

class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  int _selectedIndex = 0; // Initial tab index

  // Pages for each tab
  final List<Widget> _pages = [
    HomePage(), // Example page 1
    CategoriesPage(), // Example page 2
    CalendarPage(), // Calendar page
    CompletedTasksPage(), // Example page 3
    SettingsPage(), // Example page 4
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List App'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
            icon: Icon(Icons.check_circle),
            label: 'Completed Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
