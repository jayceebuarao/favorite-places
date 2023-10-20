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
      title: Text(
        place.title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        place.location.address,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: FileImage(place.image),
      ),
    );
  }
}
