import 'package:flutter/material.dart';
import 'package:movies_now/src/models/models.dart';

class PhotoScroller extends StatelessWidget {
  PhotoScroller(this.images);

  final images;
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  Widget _buildPhoto(BuildContext context, int index) {
    Backdrops photo = images[index];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(
          image_url + photo.file_path,
          width: 160.0,
          height: 120.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Photos',
          style: textTheme.subhead.copyWith(fontSize: 18.0),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}
