import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Column com Imagem Local, Texto e Botão',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo Column'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center( 
                child: Image.asset(
                'assets/iade.jpg',  // caminho da imagem local
                height: 150,
              ),
              ),
              SizedBox(height: 20),
              Text(
                'Este é um texto exemplo em Flutter',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('Botão pressionado!');
                },
                child: Text('Clique aqui'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
