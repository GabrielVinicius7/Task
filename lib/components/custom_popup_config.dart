import 'package:flutter/material.dart';
import 'custom_drawer_config_newpass.dart';

TextEditingController senhaAtual = TextEditingController();

AlertDialog customDialog(context) {
  return AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Digite sua senha ',
            ),
            controller: senhaAtual,
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
              if (senhaAtual.text == "123") {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (_) => customDialogPass(context));
                    senhaAtual.clear();
              }
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
