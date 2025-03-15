import 'package:task/shared/http_service.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class MyDrawer extends StatefulWidget {
  final BuildContext context;

  const MyDrawer(BuildContext ctx, {Key? key, required this.context})
      : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

class _MyDrawerState extends State<MyDrawer> {
  String currentToken = '';
  Map<String, dynamic> decodedToken = {};
  bool isTokenExpired = false;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  void _checkToken() {
    currentToken = getToken();
    if (currentToken.isNotEmpty) {
      decodedToken = JwtDecoder.decode(currentToken);
    } else {
      debugPrint("Token is empty or invalid.");
    }
    isTokenExpired = JwtDecoder.isExpired(currentToken);

    debugPrint("Token: $currentToken");
    debugPrint("Role: ${decodedToken["info"]["role"]}");

    if (isTokenExpired) {
      Navigator.pushNamedAndRemoveUntil(
        widget.context,
        "/",
        (Route<dynamic> route) => false,
      );
    }
  }

  String getToken() {
    // Substitua isso pelo seu método de obtenção do token
    return ApiRequest.token;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(6, 255, 255, 255),
                  backgroundImage: AssetImage('assets/images/icon.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  'Bem-vindo, ${capitalize(decodedToken["sub"] ?? "Usuário")}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  decodedToken["info"]["role"] ?? 'Usuário',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
            leading: const Icon(Icons.phone),
            title: const Text('Histórico de chamadas'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/notespage");
            },
            leading: const Icon(Icons.business_center_sharp),
            title: const Text('Minhas anotações'),
          ),
          if (decodedToken["info"]["role"] == "ADMIN") ...[
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/users");
              },
              leading: const Icon(Icons.person),
              title: const Text('Usuários'),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/register");
              },
              leading: const Icon(Icons.app_registration_outlined),
              title: const Text('Registrar'),
            ),
          ],
          Divider(),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/config");
            },
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/",
                (Route<dynamic> route) => false,
              );
            },
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
