import 'package:favorite_places/providers/favorites_provider.dart';
import 'package:favorite_places/screens/new_place.dart';
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
        builder: (context) => const NewPlaceScreen(),
      ),
    );
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
          itemBuilder: (context, index) => const FavoritePlaceItem(),
          itemCount: favoritePlaces.length),
    );
  }
}
