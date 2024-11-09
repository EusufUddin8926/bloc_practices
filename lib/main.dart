import 'package:counter_bloc/bloc/counter/counter_bloc.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:counter_bloc/bloc/switch/switch_bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_bloc.dart';
import 'package:counter_bloc/ui/image_picker_screen.dart';
import 'package:counter_bloc/ui/to_do.dart';
import 'package:counter_bloc/utils/image_picker_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (context) => ToDoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
