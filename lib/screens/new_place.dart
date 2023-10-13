import 'package:flutter/material.dart';

class NewPlaceScreen extends StatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  State<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              maxLength: 50,
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
              onPressed: () {},
              child: const Text('Add Place'),
            ),
          ],
        )),
      ),
    );
  }
}
