
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Empresa/Atendeu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("${call.company}  /  ${call.name}"),
            const SizedBox(height: 20),
            const Text(
              'Contato',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(call.name),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 25),
                Column(
                  children: [
                    const Text(
                      'Data',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(call.date.showDateFormatted()),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    const Text(
                      'Hora',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(call.date.showDateFormatted()),
                  ],
                ),
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

// class CallHistoryPopup extends StatefulWidget {
//   final int index;

//   const CallHistoryPopup({super.key, required this.index});

//   @override
//   State<CallHistoryPopup> createState() => _CallHistoryPopupState();
// }

// class _CallHistoryPopupState extends State<CallHistoryPopup> {
//   Call? _call;
//   bool _isLoading = true;
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _fetchCallDetails();
//   }

//   Future<void> _fetchCallDetails() async {
//     try {
//       var response = await ApiRequest.get(endpoint: "api/call/${widget.index}");

//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         String decodedBody = utf8.decode(response.bodyBytes);
//         final ApiResponseEntity body =
//             ApiResponseEntity.fromJson(jsonDecode(decodedBody));

//         if (!body.success) {
//           setState(() {
//             _isLoading = false;
//             _errorMessage = "Erro ao buscar os dados.";
//           });
//           return;
//         }

//         if (body.data.isNotEmpty) {
//           // Converta o Map<String, dynamic> para Call
//           final Call call = Call.fromJson(body.data[0]);
//           setState(() {
//             _call = call;
//             _isLoading = false;
//           });
//         } else {
//           setState(() {
//             _isLoading = false;
//             _errorMessage = "Nenhum dado encontrado.";
//           });
//         }
//       } else {
//         setState(() {
//           _isLoading = false;
//           _errorMessage = "Erro ao buscar: ${response.statusCode}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//         _errorMessage = "Falha na conexão. Verifique sua internet. Erro: $e";
//       });
//     }
//   }
// }
