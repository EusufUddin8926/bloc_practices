import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_events.dart';
import 'package:counter_bloc/bloc/todo/todo_states.dart';

class ToDoBloc extends Bloc<TodoEvents, TodoStates> {
  final List<String> todoList = [];

  ToDoBloc() : super(const TodoStates()) {
    on<InsertTodoEvent>(_insertToDoEvent);
    on<ClearTodoEvent>(_clearTodoEvent);
    on<DeleteTodoEvent>(_deleteTodoEvent);
  }

  void _insertToDoEvent(InsertTodoEvent events, Emitter<TodoStates> emit) {
    todoList.add(events.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _clearTodoEvent(ClearTodoEvent event, Emitter<TodoStates> emit) {
    todoList.clear();
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _deleteTodoEvent(DeleteTodoEvent event, Emitter<TodoStates> emit) {
    todoList.removeAt(event.index);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
