import 'package:flutter/material.dart';

class SearchScreenNotes extends StatelessWidget {
  final Function(String) onSearch; // Callback para enviar o texto digitado

  const SearchScreenNotes({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onSearch, // Chama a callback sempre que o usuário digita
        decoration: const InputDecoration(
          labelText: 'Buscar',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
