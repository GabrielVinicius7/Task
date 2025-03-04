import 'package:erpecommerce/views/dashboard/entities/note.dart';
import 'package:flutter/material.dart';

class CallHistoryPopup extends StatelessWidget {
  final Call call;
  const CallHistoryPopup({super.key, required this.call});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 10),
          Text(
            call.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Situação',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            call.company,
          ),
          const SizedBox(height: 20),
          const Text(
            'Empresa',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            call.situation,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 25),
              Column(
                children: [
                  const Text(
                    'Contato',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    call.contact,
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                children: [
                  const Text(
                    'Data',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(call.date.showDateFormatted()),
                ],
              ),
            ],
          ),
          const SizedBox(width: 250),
        ]),
      ),
    );
  }
}
