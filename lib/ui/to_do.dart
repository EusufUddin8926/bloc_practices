import 'package:counter_bloc/bloc/todo/todo_bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_events.dart';
import 'package:counter_bloc/bloc/todo/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, TodoStates>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todoList?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.todoList![index].toString()),
                trailing: InkWell(
                    onTap: () {
                      context.read<ToDoBloc>().add(DeleteTodoEvent(index: index));
                    },
                    child: const Icon(Icons.delete)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        context.read<ToDoBloc>().add(ClearTodoEvent());
        for (int i = 0; i < 10; i++) {
          context.read<ToDoBloc>().add(InsertTodoEvent(task: 'Task : ${i}'));
        }
      }),
    );
  }
}
