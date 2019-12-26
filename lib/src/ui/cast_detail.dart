import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CastDetails extends StatelessWidget {
  final actorDetail;
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  CastDetails(this.actorDetail);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        actorDetail.profile_path == null
            ? Image.asset('assets/actor.png',fit: BoxFit.cover,)
            : FadeInImage(
                placeholder: AssetImage(''),
                image: NetworkImage(image_url + actorDetail.profile_path),
                fit: BoxFit.cover,
              ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: Container(color:Colors.black.withOpacity(0.4),),
        ),
      ],
    );
  }
}
