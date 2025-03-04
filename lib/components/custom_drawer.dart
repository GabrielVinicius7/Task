import 'package:flutter/material.dart';

Drawer customdrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/home");
          },
          leading: const Icon(Icons.phone),
          title: const Text('Histórico de chamadas'),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/notespage");
          },
          leading: const Icon(Icons.business_center_sharp),
          title: const Text('Minhas anotações'),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "/config");
          },
          leading: const Icon(Icons.settings),
          title: const Text('Configurações'),
        ),
        ListTile(
          onTap: () {
            // Remove todas as rotas da pilha e leva o usuário para a tela de login
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/",
              (Route<dynamic> route) => false, // Remove todas as rotas anteriores
            );
          },
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
        ),
      ],
    ),
  );
}
