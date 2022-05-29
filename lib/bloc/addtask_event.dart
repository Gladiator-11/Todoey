part of 'addtask_bloc.dart';

abstract class AddtaskEvent extends Equatable {
  const AddtaskEvent();

  @override
  List<Object> get props => [];
}

class addtaskevent extends AddtaskEvent {
  final String? newtasktitle;
  addtaskevent({required this.newtasktitle});
}

class updatetask extends AddtaskEvent {
  final Task task;
  updatetask({required this.task});
}

class deletetask extends AddtaskEvent {
  final Task task;
  deletetask({required this.task});
}
