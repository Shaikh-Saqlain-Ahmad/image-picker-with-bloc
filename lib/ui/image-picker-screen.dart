import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_with_bloc/bloc/image_picker_bloc.dart';
import 'package:image_picker_with_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_with_bloc/bloc/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("Image Picker Using Bloc"))),
        body: Center(
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              if (state.file == null) {
                return InkWell(
                  onTap: () {
                    context.read<ImagePickerBloc>().add(CameraCaptureEvent());
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.camera),
                  ),
                );
              } else {
                return Image.file(File(state.file!.path.toString()));
              }
            },
          ),
        ));
  }
}
