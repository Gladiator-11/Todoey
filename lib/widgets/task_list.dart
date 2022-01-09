import 'package:flutter/material.dart';
import 'package:todoey_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/tasks_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskdata, child) {
      return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              Tasktitle: task.name,
              checkboxcallback: (checkboxstate) {
                taskdata.updatetask(task);
              },
              longpresscallback: () {
                taskdata.deletetask(task);
              },
            );
          },
          itemCount: taskdata.taskcount);
    });
  }
}
