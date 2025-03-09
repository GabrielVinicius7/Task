import 'package:erpecommerce/shared/http_service.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class MyDrawer extends StatefulWidget {
  final BuildContext context;

  const MyDrawer(BuildContext ctx, {Key? key, required this.context}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
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
          if(decodedToken["info"]["role"]== "ADMIN")
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/register");
              },
              leading: const Icon(Icons.app_registration_outlined),
              title: const Text('Registrar'),
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
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/",
                (Route<dynamic> route) => false,
              );
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}