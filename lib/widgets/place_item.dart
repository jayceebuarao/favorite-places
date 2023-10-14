import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class FavoritePlaceItem extends StatelessWidget {
  const FavoritePlaceItem({
    super.key,
    required this.place,
    required this.onTap,
  });

  final Place place;
  final void Function(Place place) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(place);
      },
      title: Text(place.title),
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: FileImage(place.image),
      ),
    );
  }
}
