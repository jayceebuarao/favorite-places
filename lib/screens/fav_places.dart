import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/favorites_provider.dart';
import 'package:favorite_places/screens/fav_place_detail.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/widgets/fav_place_item.dart';

class FavoritePlacesScreen extends ConsumerStatefulWidget {
  const FavoritePlacesScreen({super.key});

  @override
  ConsumerState<FavoritePlacesScreen> createState() =>
      _FavoritePlacesScreenState();
}

class _FavoritePlacesScreenState extends ConsumerState<FavoritePlacesScreen> {
  void newPlace() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPlaceScreen(),
      ),
    );
  }

  void openPlaceDetail(Place place) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FavoritePlaceDetailScreen(place: place)));
  }

  @override
  Widget build(BuildContext context) {
    final favoritePlaces = ref.watch(favoritePlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: newPlace, icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => FavoritePlaceItem(
                place: favoritePlaces[index],
                onTap: openPlaceDetail,
              ),
          itemCount: favoritePlaces.length),
    );
  }
}
