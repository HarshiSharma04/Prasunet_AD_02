import 'package:flutter/material.dart';
import 'home_page.dart';
import 'splash_screen.dart'; // Ensure this import points to your splash screen file

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
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
       /* '/add-task': (context) => AddTaskPage(),
        '/completed-tasks': (context) => CompletedTasksPage(),
        '/categories': (context) => CategoriesPage(),
        '/settings': (context) => SettingsPage(), */
      },
    );
  }
}
