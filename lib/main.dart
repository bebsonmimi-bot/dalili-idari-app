import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AdminTaskApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class AdminTaskApp extends StatefulWidget {
  @override
  _AdminTaskAppState createState() => _AdminTaskAppState();
}

class _AdminTaskAppState extends State<AdminTaskApp> {
  // قائمة المهام الخاصة بالوثائق الإدارية
  List<Map<String, dynamic>> tasks = [
    {"name": "نسخة من بطاقة التعريف", "isDone": false},
    {"name": "شهادة ميلاد حديثة", "isDone": false},
    {"name": "طابع ضريبي", "isDone": false},
    {"name": "صور شمسية", "isDone": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("منظم مهامي الإدارية"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: CheckboxListTile(
              title: Text(tasks[index]["name"]),
              value: tasks[index]["isDone"],
              onChanged: (bool? newValue) {
                setState(() {
                  tasks[index]["isDone"] = newValue!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}