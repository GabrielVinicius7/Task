import 'package:flutter/material.dart';

AlertDialog CustomDialog(context){
  return const AlertDialog(
    title: Text(""),
    content: Column(
      children: [
        TextField(
          decoration:InputDecoration(
            labelText:'Empresa',
          ) ,
        ),
         TextField(
          decoration:InputDecoration(
            labelText:'Nome',
          ) ,
        ),
         TextField(
          decoration:InputDecoration(
            labelText:'Data',
          ) ,
        ),
         TextField(
          decoration:InputDecoration(
            labelText:'Problema',
          ) ,
        ),
         TextField(
          decoration:InputDecoration(
            labelText:'Solução',
          ) ,
        ),
      ],
    ),
    actions: [
      
    ],
  );
}