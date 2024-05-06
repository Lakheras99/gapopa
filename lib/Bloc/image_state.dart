
import '../models/image_model.dart';

abstract class ImageState {}

class ImagesLoadingState extends ImageState {}

class ImagesLoadedState extends ImageState {
  final List<ImageModel> images;

  ImagesLoadedState({required this.images});
}

class ImagesErrorState extends ImageState {
  final String error;

  ImagesErrorState({required this.error});
}
