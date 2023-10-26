import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super([]);

  void addFavoritePlace(
      String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace =
        Place(title: title, image: copiedImage, location: location);
    state = [newPlace, ...state];
  }

  void removeFavoritePlace(String placeId) {
    state = [
      for (final place in state)
        if (place.id != placeId) place,
    ];
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>(
        (ref) => FavoritePlacesNotifier());
