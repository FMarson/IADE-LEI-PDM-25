import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Multiples Columns dentro de Row')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Primeira coluna
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, size: 40),
                    SizedBox(height: 8),
                    Text('Texto 1'),
                    SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, child: Text('Botão 1')),
                  ],
                ),
                SizedBox(width: 50), // Espaço entre colunas

                // Segunda coluna
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, size: 40),
                    SizedBox(height: 8),
                    Text('Texto 2'),
                    SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, child: Text('Botão 2')),
                  ],
                ),
                SizedBox(width: 50),

                // Terceira coluna
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.abc, size: 40),
                    SizedBox(height: 8),
                    Text('Texto 3'),
                    SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, child: Text('Botão 3')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
