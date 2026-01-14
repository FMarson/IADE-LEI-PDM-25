import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget{
  const TelaPerfil({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 93, 151),
          foregroundColor: Colors.white,
          title:const Text('Perfil'),
      ),
      body: const Center(
          child: Text('Conteúdo de tela'),
        ),
    );
  }
  
}