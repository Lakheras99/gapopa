import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image_bloc.dart';
import '../bloc/image_event.dart';
import '../bloc/image_state.dart';
import '../widgets/image_grid.dart';
import '../widgets/search_bar.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageBloc = BlocProvider.of<ImageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixabay Gallery'),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            onSearch: (query) {
              imageBloc.add(FetchImagesEvent(query: query));
            },
          ),
          Expanded(
            child: BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                if (state is ImagesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ImagesLoadedState) {
                  return ImageGrid(images: state.images);
                } else if (state is ImagesErrorState) {
                  return Center(child: Text(state.error));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
