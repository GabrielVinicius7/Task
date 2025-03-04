import 'package:flutter/material.dart';
import 'package:erpecommerce/views/dashboard/entities/call.dart';

class CallHistoryPopup extends StatelessWidget {
  final Call call;
  const CallHistoryPopup({super.key, required this.call});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Alinha os itens ao centro
          children: [
            const Text(
              'Empresa/Atendeu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("${call.company}  /  ${call.name}"),
            const SizedBox(height: 25),
            const Text(
              'Contato',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(call.name),
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Alinha os itens ao centro
              children: [
                const Text(
                  'Data',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(call.date.showDateFormatted()),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Problema',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(call.problem),
            const SizedBox(height: 20),
            const Text(
              'Solução',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(call.solution),
          ],
        ),
      ),
    );
  }
}
