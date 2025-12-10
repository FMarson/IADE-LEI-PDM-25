import 'package:flutter/material.dart';
import 'telas/tela1.dart';
import 'telas/tela2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App com Rotas Nomeadas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const Tela1(),
        '/tela2': (context) => const Tela2(),
      },
    );
  }
}
