import 'dart:io';

import 'package:counter_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_picker/image_picker_events.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(builder: (context, state) {
          return state.file == null
              ? InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  child: const Icon(Icons.camera))
              : Image.file(File(state.file!.path));
        }),
      ),
    );
  }
}
