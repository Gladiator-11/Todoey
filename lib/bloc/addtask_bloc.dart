import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/task.dart';
part 'addtask_event.dart';
part 'addtask_state.dart';

class AddtaskBloc extends Bloc<AddtaskEvent, AddtaskState> {
  List<Task> _tasks = [];

  int get taskcount {
    return _tasks.length;
  }

  AddtaskBloc() : super(AddtaskInitial()) {
    on<addtaskevent>(_onaddtask);
    on<updatetask>(_onupdatetask);
    on<deletetask>(_ondeletetask);
  }

  void _onaddtask(addtaskevent, emit) {
    final task = Task(name: addtaskevent.newtasktitle);
    _tasks.add(task);
    emit(TaskAdded(tasks: _tasks, taskcount: taskcount));
  }

  void _onupdatetask(updatetask, emit) {
    updatetask.task.done();
    emit(TaskAdded(tasks: _tasks, taskcount: taskcount));
  }

  void _ondeletetask(deletetask, emit) {
    _tasks.remove(deletetask.task);
    emit(TaskAdded(tasks: _tasks, taskcount: taskcount));
  }
}
