import 'package:flutter/material.dart';
import 'package:task/components/custom_drawer.dart';
import 'dart:convert';
import 'package:task/shared/http_service.dart';

class Users extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

class _ListaUsuariosState extends State<Users> {
  Future<List<dynamic>> buscarUsuarios() async {
    try {
      var response = await ApiRequest.get(endpoint: "api/user/all");

      if (!mounted) return [];

      if (response.statusCode == 200) {
        String decodedBody =
            utf8.decode(response.bodyBytes, allowMalformed: true);
        return jsonDecode(decodedBody);
      } else {
        throw Exception("Erro ao carregar usuários: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Falha na conexão. Verifique sua internet.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(context, context: context),
      appBar: AppBar(centerTitle: true, title: const Text('Usuários')),
      body: FutureBuilder<List<dynamic>>(
        future: buscarUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<dynamic> usuarios = snapshot.data!;

            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                var usuario = usuarios[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                      capitalize(usuario["username"] ?? 'Nome não disponível')),
                  subtitle: Text(usuario["email"] ?? 'Email não disponível'),
                  onTap: () {
                    print('Clicou em ${usuario["username"]}');
                  },
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum usuário encontrado'));
          }
        },
      ),
    );
  }
}
