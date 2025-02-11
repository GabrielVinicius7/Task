import 'dart:convert';
import 'package:erpecommerce/components/custom_drawer.dart';
import 'package:erpecommerce/components/custom_popup_home.dart';
import 'package:erpecommerce/components/custom_popup_view_home.dart';
import 'package:erpecommerce/shared/entities/api_response_entity.dart';
import 'package:erpecommerce/shared/http_service.dart';
import 'package:erpecommerce/views/dashboard/entities/call.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); // Nome corrigido
}

class _HomeState extends State<Home> {
  List<Call> _calls = []; // Nome corrigido
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCalls();
  }

  Future<void> _fetchCalls() async {
    try {
      var response = await ApiRequest.get(endpoint: "api/call/"); // Await único

      if (!mounted) return;

      if (response.statusCode == 200) {
        String decodedBody = utf8.decode(response.bodyBytes);
        final ApiResponseEntity body =
            ApiResponseEntity.fromJson(jsonDecode(decodedBody));
        if (!body.success) return;
        final List<Call> calls =
            body.data.map((e) => Call.fromJson(e)).toList();

        if (!mounted) return;
        setState(() {
          _calls = calls;
          _isLoading = false;
        });
      } else {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _errorMessage = "Erro ao carregar dados: ${response.statusCode}";
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = "Falha na conexão. Verifique sua internet.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: customdrawer(context),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Row(
          children: [
            SizedBox(width: 25),
            Text(
              'Histórico de Ligações',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(), // Método separado para organização
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    if (_calls.isEmpty) {
      return const Center(child: Text('Nenhuma ligação registrada'));
    }

    return Stack(
      children: [
        ListView.separated(
          itemCount: _calls.length, // Use _calls ao invés de ligacoes
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final call = _calls[index];
            return _buildCallItem(call, index);
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => customDialog(context),
              ).then((_) => _fetchCalls());
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildCallItem(Call call, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 197, 189, 189),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (_) => customPopUp(context, index),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${call.company}  /  ${call.name}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        call.date, // Exibe apenas a data
                        style: const TextStyle(fontSize: 16),
                      ),
                      // Text(
                      //   call.date.split(' ')[1], // Exibe apenas a hora
                      //   style: const TextStyle(fontSize: 16),
                      // ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          call.problem,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          call.solution,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => customDialog(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
