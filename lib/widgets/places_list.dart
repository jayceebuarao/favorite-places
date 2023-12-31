import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/widgets/place_item.dart';

class PlacesList extends ConsumerStatefulWidget {
  const PlacesList({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlacesListState();
}

class _PlacesListState extends ConsumerState<PlacesList> {
  void _selectPlace(Place place) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlaceDetailScreen(place: place)));
  }

  @override
  Widget build(BuildContext context) {
    final places = widget.places;

    Widget content = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemBuilder: (context, index) => FavoritePlaceItem(
                place: places[index],
                onTap: _selectPlace,
              ),
          itemCount: places.length),
    );

    if (places.isEmpty) {
      content = Center(
        child: Text(
          'No Favorites yet :)',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return content;
  }
}
