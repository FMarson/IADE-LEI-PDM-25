import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 10, 4, 53),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'usuário123',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'usuario123@email.com',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'João da Silva',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Idade: 30 anos',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
