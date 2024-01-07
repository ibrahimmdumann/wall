import 'package:davodeneme/pages/fullscreen_photo/fullscreen_photo_page.dart';
import 'package:davodeneme/shared/models/photo_model.dart';
import 'package:davodeneme/shared/services/photo_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget with PhotoService {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPhoto(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        List<ICrmPersonsResponse>? _photos = snapshot.data as List<ICrmPersonsResponse>?;
        return GridView.builder(
          itemCount: _photos!.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              FullScreenPhoto(photo: _photos[index])));
                }),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: _photos[index].id,
                    child: Image.network(_photos[index].thumbnailUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        );
      },
    );
  }
}
