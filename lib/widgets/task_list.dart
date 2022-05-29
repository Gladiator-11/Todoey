import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey_app/bloc/addtask_bloc.dart';
import 'package:todoey_app/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddtaskBloc, AddtaskState>(builder: (context, state) {
      if (state is TaskAdded) {
        return ListView.builder(
            itemBuilder: (context, index) {
              final taskdata = state.tasks[index];
              return TaskTile(
                isChecked: taskdata.isDone,
                Tasktitle: taskdata.name,
                checkboxcallback: (checkboxstate) {
                  context.read<AddtaskBloc>().add(updatetask(task: taskdata));
                },
                longpresscallback: () {
                  context.read<AddtaskBloc>().add(deletetask(task: taskdata));
                },
              );
            },
            itemCount: state.taskcount);
      } else {
        return Center(
          child: Text(
            'Press " + " to add your first task',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }
    });
  }
}
