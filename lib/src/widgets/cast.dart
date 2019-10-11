import 'package:flutter/material.dart';

import '../ui/cast_detail.dart';

class ActorScroller extends StatelessWidget {
  ActorScroller(this.actors);

  final actors;
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  Widget _buildActor(BuildContext context, int index) {
    var actor = actors[index];
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CastDetails(actor);
      })),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: actor.profile_path == null
                ? AssetImage('assets/actor.png')
                : NetworkImage(image_url + actor.profile_path),
            radius: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(actor.name),
          ),
          Text(actor.character)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Actors',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(150.0),
          child: ListView.builder(
            itemCount: actors.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}
