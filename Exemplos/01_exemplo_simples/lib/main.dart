import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Três Colunas',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Três Colunas'),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.redAccent,
                alignment: Alignment.center,
                child: const Text(
                  'Coluna 1',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.greenAccent,
                alignment: Alignment.center,
                child: const Text(
                  'Coluna 2',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blueAccent,
                alignment: Alignment.center,
                child: const Text(
                  'Coluna 3',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
