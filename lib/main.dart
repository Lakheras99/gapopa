import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/image_bloc.dart';
import 'screens/gallery_screen.dart';
import 'services/pixabay_service.dart';

void main() async {
  final pixabayService = PixabayService();
  final images = await pixabayService.fetchImages(query: 'yellow+flower');
  print(images);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixabay Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => ImageBloc(service: PixabayService()),
        child: GalleryScreen(),
      ),
    );
  }
}
