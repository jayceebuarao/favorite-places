import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class FavoritePlaceItem extends StatelessWidget {
  const FavoritePlaceItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(place.title),
    );
  }
}
