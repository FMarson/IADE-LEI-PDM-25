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
      home: TelaInicial()
    );
  }
}
    
    
  class TelaInicial extends StatelessWidget {    
    const TelaInicial({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 93, 151),
          foregroundColor: Colors.white,
          title:const Text('Minha app'),
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: Icon(Icons.person_4_rounded), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaPerfil()),);
            },
            ),
            IconButton(icon: Icon(Icons.question_mark), onPressed: () {
              showDialog(context: context, 
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Minha App'),
                              content: const Text('Esta é a versão 0.1 da minha app.'),
                              actions: [
                              TextButton(onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'))
                            ]
                             );
                            
                          });
            }),
            ],
        ),
        body: const Center(
          child: Text('Conteúdo de tela'),
        ),
    );
  }
}
