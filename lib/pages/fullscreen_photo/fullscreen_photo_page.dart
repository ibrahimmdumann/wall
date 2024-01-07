import 'dart:ui';

import 'package:davodeneme/shared/models/photo_model.dart';
import 'package:flutter/material.dart';

class FullScreenPhoto extends StatelessWidget {
  final ICrmPersonsResponse photo;
  const FullScreenPhoto({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ((() {
        Navigator.pop(context);
      })),
      child: Hero(
        tag: '${photo.id}',
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(photo.thumbnailUrl.toString()))),
          child: Image.network(
            photo.url.toString(),
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
