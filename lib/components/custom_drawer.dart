import 'package:flutter/material.dart';

Drawer customdrawer(context) {
  return Drawer(
        child: ListView(
          children:  [
          ListTile(
            onTap:(){
              Navigator.pushNamed(context,"/home");
            }, 
            leading:const Icon(Icons.phone),
            title:const Text('Historico de chamadas'),
          ),
           ListTile(
            onTap:(){
              Navigator.pushNamed(context,"/notespage");
            }, 
            leading:const Icon(Icons.business_center_sharp),
            title:const Text('Minhas anotações'),
          ),
           ListTile(
            onTap:(){
              Navigator.pushNamed(context,"/config");
            }, 
            leading:const Icon(Icons.settings),
            title:const Text('Configurações'),
          )
          ],
        ),
      );
}
