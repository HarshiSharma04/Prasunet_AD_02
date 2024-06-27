import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Color(0xFF5C415D)),),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
