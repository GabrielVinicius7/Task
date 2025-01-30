import 'package:flutter/material.dart';

AlertDialog customDialog(context) {
  return AlertDialog(
    content: const SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Empresa',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Contato',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Data',
            ),
            
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Problema',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Solução',
            ),
          ),
        ],
      ),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            //Navigator.pushNamed(context,"/home");
            child: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 60),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        ],
      )
    ],
  );
}
