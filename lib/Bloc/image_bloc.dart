import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/pixabay_service.dart';
import 'image_event.dart';
import 'image_state.dart';
import '../models/image_model.dart'; // Import the ImageModel class

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final PixabayService service;

  ImageBloc({required this.service}) : super(ImagesLoadingState());

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is FetchImagesEvent) {
      yield ImagesLoadingState();
      try {
        final imagesData = await service.fetchImages(query: event.query);
        final images = imagesData.map((data) => ImageModel.fromJson(data)).toList(); // Convert Map<String, dynamic> to ImageModel
        yield ImagesLoadedState(images: images);
      } catch (e) {
        yield ImagesErrorState(error: 'Failed to fetch images');
      }
    }
  }
}
