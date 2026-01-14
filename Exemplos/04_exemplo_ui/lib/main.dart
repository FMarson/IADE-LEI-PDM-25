import 'package:flutter/material.dart';
import 'tela_perfil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 4, 53),
        foregroundColor: Colors.white,
        title: const Center(child: Text('Minha Aplicação')),
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: [
                    IconButton(
                      icon: const Icon(Icons.person_4_rounded),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TelaPerfil()),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.question_mark),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Minha App'),
                              content: const Text('Esta é a versão 0.1 da aplicação Minha App.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // fecha o diálogo
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
      ),
      body: const Center(
        child: Text('Conteúdo da tela'),
      ),
    );
  }
}
