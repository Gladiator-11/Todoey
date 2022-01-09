import 'package:flutter/material.dart';
import 'package:todoey_app/models/tasks_data.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
