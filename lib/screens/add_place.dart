import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  void _savePlace() {
    ref
        .read(favoritePlacesProvider.notifier)
        .addFavoritePlace(Place(title: titleController.text));

    print('savePlace called');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                maxLength: 50,
                style: TextStyle(color: Theme.of(context).primaryColorLight),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.title),
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: _savePlace,
                child: const Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
