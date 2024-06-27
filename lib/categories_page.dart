import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = ['Work', 'Personal', 'Shopping', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(categories[index]),
            ),
          );
        },
      ),
    );
  }
}
