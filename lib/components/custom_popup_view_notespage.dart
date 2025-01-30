import 'package:flutter/material.dart';
import 'package:erpecommerce/shared/mock_notespage.dart';



AlertDialog customPopUp(context, index) {
    Lembre getters = Lembre();
    List<Lembrete> lembretes = getters.pegarlembre();
  return AlertDialog(
    content:  SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height:10),
          Text(
            lembretes[index].titulo,
            style: const TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold,
            ),
          ),
          const SizedBox(height:20),
          const Text(
            'Situação',
            style: TextStyle(
              fontSize:16,
              fontWeight:FontWeight.bold, 
            ),
          ),
          const SizedBox(height:10),
           Text(
             lembretes[index].situacao,
          ),
          const SizedBox(height:20),
          const Text(
            'Empresa',
            style: TextStyle(
              fontSize:16,
              fontWeight:FontWeight.bold, 
            ),
          ),
          const SizedBox(height:10),
          Text(
            lembretes[index].empresa,
          ),
          const SizedBox(height:20),
          Row(
            children: [
              const SizedBox(width:25),
              Column(
                children: [
                  const Text(
                    'Contato',
                    style: TextStyle(
                      fontSize:16,
                      fontWeight:FontWeight.bold, 
                    ),
                  ),
                  const SizedBox(height:10),
                  Text(
                    lembretes[index].contato,
                  ),
                ],
              ),
              const SizedBox(width:50),
              const Column(
                children: [
                  Text('Data',
                style: TextStyle(
                  fontSize:16,
                  fontWeight:FontWeight.bold, 
                ),
                ),
                SizedBox(height:10),
                Text('Valor Data'),
                ],
              ),
            ],
          ),
          const SizedBox(width:250),
        ]
      ),
    ),
  );
}
