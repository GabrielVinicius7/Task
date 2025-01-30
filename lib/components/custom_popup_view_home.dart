import 'package:flutter/material.dart';
import 'package:erpecommerce/shared/mock_home.dart';



AlertDialog customPopUp(context, index) {
    Getters getters = Getters();
    List<Ligacao> ligacoes = getters.pegarDados();
  return AlertDialog(
    content:  SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Empresa/Atendeu',
            style: TextStyle(
              fontSize:16,
              fontWeight:FontWeight.bold, 
            ),
          ),
          const SizedBox(height:10),
          Text(
            "${ligacoes[index].empresa}  /  ${ligacoes[index].nome}",
          ),
          const SizedBox(height:20),
          const Text(
            'Contato',
            style: TextStyle(
              fontSize:16,
              fontWeight:FontWeight.bold, 
            ),
          ),
          const SizedBox(height:10),
           Text(
             ligacoes[index].contato,
          ),
          const SizedBox(height:20),
          const Row(
           children: [
            SizedBox(width:25 ),
            Column(
              children: [
                Text('Data',
                style: TextStyle(
                  fontSize:16,
                  fontWeight:FontWeight.bold, 
                ),
                ),
                SizedBox(height:5),
                Text('Valor Data'),
              ],
            ),
            SizedBox(width:50),
            Column(
              children: [
                Text('Hora',
                style: TextStyle(
                  fontSize:16,
                  fontWeight:FontWeight.bold, 
                ),
                ),
                SizedBox(height:5),
                Text('Valor Hora'),
              ],
            ),
           ],
          ),
          const SizedBox(height:20),
          const Text(
            'Problema',
            style: TextStyle(
              fontSize:16,
              fontWeight:FontWeight.bold, 
            ),
          ),
          const SizedBox(height:10),
          Text(
            ligacoes[index].problema,
          ),
          const SizedBox(height:20),

           const Text(
            'Solução',
            style: TextStyle(
              fontSize:16,
              fontWeight:FontWeight.bold, 
            ),
          ),
          const SizedBox(height:10),
          Text(
            ligacoes[index].solucao,
          ),
        ],
      ),
    ),
  );
}
