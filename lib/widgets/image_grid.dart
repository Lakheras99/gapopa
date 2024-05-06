import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageGrid extends StatelessWidget {
  final List<ImageModel> images;

  ImageGrid({required this.images});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust based on screen width
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return ImageTile(image: image);
      },
    );
  }
}

class ImageTile extends StatelessWidget {
  final ImageModel image;

  ImageTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement full-screen view logic
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Image.network(image.imageUrl, fit: BoxFit.cover),
          const SizedBox(height: 4),
          Text('Likes: ${image.likes}'),
          Text('Views: ${image.views}'),
        ],
      ),
    );
  }
}
