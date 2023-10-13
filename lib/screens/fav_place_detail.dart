import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class FavoritePlaceDetail extends StatelessWidget {
  const FavoritePlaceDetail({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
    );
  }
}
