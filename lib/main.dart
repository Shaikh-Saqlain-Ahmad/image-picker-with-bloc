import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_with_bloc/bloc/image_picker_bloc.dart';
import 'package:image_picker_with_bloc/ui/image-picker-screen.dart';
import 'package:image_picker_with_bloc/utils/image-picker-utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()))
        ],
        child: MaterialApp(
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: const ImagePickerScreen()));
  }
}
