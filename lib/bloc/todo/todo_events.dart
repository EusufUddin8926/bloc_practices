import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();
}

class InsertTodoEvent extends TodoEvents {
  final String task;

  const InsertTodoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTodoEvent extends TodoEvents {
  final int index;

  const DeleteTodoEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class ClearTodoEvent extends TodoEvents {
  @override
  List<Object?> get props => [];
}
