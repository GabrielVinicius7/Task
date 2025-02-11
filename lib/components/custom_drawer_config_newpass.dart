import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

AlertDialog customDialogPass(context) {
  return AlertDialog(
    content: const SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Nova Senha',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Confirmar senha',
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
              Fluttertoast.showToast(msg: "Senha alterada");
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
