import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newtasktitile) {
    final task = Task(name: newtasktitile);
    _tasks.add(task);
    notifyListeners();
  }

  int get taskcount {
    return tasks.length;
  }

  void updatetask(Task task) {
    task.done();
    notifyListeners();
  }

  void deletetask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
