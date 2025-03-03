import 'dart:convert';
import 'package:erpecommerce/components/custom_drawer.dart';
import 'package:erpecommerce/components/custom_popup_home.dart';
import 'package:erpecommerce/components/custom_popup_view_home.dart';
import 'package:erpecommerce/shared/http_service.dart';
import 'package:erpecommerce/views/dashboard/entities/call.dart';
import 'package:flutter/material.dart';

// Tela principal do aplicativo
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Call> _calls = []; // Lista para armazenar as chamadas recuperadas do servidor
  bool _isLoading = true; // Indica se os dados ainda estão sendo carregados
  String? _errorMessage; // Armazena mensagens de erro em caso de falha na requisição

  @override
  void initState() {
    super.initState();
    _fetchCalls(); // Carrega os dados ao iniciar a tela
  }

  // Método responsável por buscar as chamadas no servidor
  Future<void> _fetchCalls() async {
    try {
      var response = await ApiRequest.get(endpoint: "api/call"); // Faz requisição GET para obter os dados
      print("Resposta do servidor: ${response.body}");

      if (!mounted) return;

      if (response.statusCode == 200) {
        // Decodifica a resposta para lidar com caracteres especiais
        String decodedBody = utf8.decode(response.bodyBytes, allowMalformed: true);
        final List<dynamic> jsonList = jsonDecode(decodedBody);
        final List<Call> calls = jsonList.map((json) => Call.fromJson(json)).toList();

        if (!mounted) return;
        setState(() {
          _calls = calls;
          _isLoading = false;
        });
      } else {
        // Caso a resposta não seja bem-sucedida, define a mensagem de erro
        if (!mounted) return;
        setState(() {
          _isLoading = false;
          _errorMessage = "Erro ao carregar dados: ${response.statusCode}";
        });
      }
    } catch (e) {
      // Captura erros de conexão e define uma mensagem de erro
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
      drawer: customdrawer(context), // Menu lateral
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Histórico de Ligações',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(), // Chama a função que constrói o corpo da tela
    );
  }

  // Constrói o corpo da tela
  Widget _buildBody() {
    if (_isLoading) {
      return Stack(
        children: [
          Center(child: CircularProgressIndicator()), // Indicador de carregamento
          _buildFloatingButton(), // Botão para adicionar nova chamada
        ],
      );
    }

    if (_errorMessage != null) {
      return Stack(
        children: [
          Center(child: Text(_errorMessage!)), // Exibe a mensagem de erro
          _buildFloatingButton(), // Botão para adicionar nova chamada
        ],
      );
    }

    if (_calls.isEmpty) {
      return Stack(
        children: [
          const Center(child: Text('Nenhuma ligação registrada')), // Mensagem caso não haja chamadas
          _buildFloatingButton(), // Botão para adicionar nova chamada
        ],
      );
    }

    return Stack(
      children: [
        ListView.separated(
          itemCount: _calls.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final call = _calls[index];
            return _buildCallItem(call);
          },
        ),
        _buildFloatingButton(), // Botão para adicionar nova chamada
      ],
    );
  }

  // Constrói o botão flutuante para adicionar uma nova chamada
  Widget _buildFloatingButton() {
    return Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CustomDialog(context),
          ).then((_) => _fetchCalls()); // Atualiza a lista após o cadastro
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Constrói um item da lista de chamadas
  Widget _buildCallItem(Call call) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (_) => CallHistoryPopup(call: call), // Exibe detalhes da chamada ao tocar
      ),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${call.company} / ${call.name}", style: const TextStyle(fontSize: 16)),
                  Text(call.date.showDateFormatted(), style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(call.problem, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16)),
                        Text(call.solution, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (_) => CustomDialog(context, call: call),
                    ).then((_) => _fetchCalls()),
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
