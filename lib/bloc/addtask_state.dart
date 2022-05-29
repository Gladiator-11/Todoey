part of 'addtask_bloc.dart';

abstract class AddtaskState {
  const AddtaskState();

  @override
  List<Object> get props => [];
}

class AddtaskInitial extends AddtaskState {}

class TaskAdded extends AddtaskState {
  final List<Task> tasks;
  final int taskcount;
  TaskAdded({required this.tasks, required this.taskcount});
}
