import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // só para alguns utilitários (p.ex. Icons), pode remover se quiser

void main() {
  runApp(const CupertinoDemoApp());
}

class CupertinoDemoApp extends StatelessWidget {
  const CupertinoDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Demo Cupertino',
      debugShowCheckedModeBanner: false,
      home: CupertinoHomePage(),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  int _selectedIndex = 0;
  final _nameController = TextEditingController();
  double _progress = 0.35;
  bool _notifications = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _openDetails() {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => DetailsPage(text: _nameController.text)),
    );
  }

  Future<void> _showDialog(String title, String content) {
    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    final cupertinoTheme = CupertinoTheme.of(context);
    final textStyle = cupertinoTheme.textTheme.navTitleTextStyle;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Demo Cupertino'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text('Demo Cupertino', style: textStyle),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nome'),
                  const SizedBox(height: 6),
                  CupertinoTextField(
                    controller: _nameController,
                    placeholder: 'Digite o seu nome',
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton.filled(
                      onPressed: () => _showDialog('Olá', 'Este é um diálogo Cupertino.'),
                      child: const Text('Mostrar diálogo'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CupertinoButton(
                      onPressed: _openDetails,
                      child: const Text('Ir para detalhes'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                onPressed: () => _showDialog('Info', 'Detalhes do utilizador (exemplo).'),
                child: const Text('Mostrar Info'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Progresso:'),
                  const SizedBox(width: 8),
                  Expanded(child: LinearProgressIndicator(value: _progress)),
                ],
              ),
              const SizedBox(height: 12),
              CupertinoSlider(
                value: _progress,
                onChanged: (v) => setState(() => _progress = v),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ativar notificações'),
                  CupertinoSwitch(value: _notifications, onChanged: (v) => setState(() => _notifications = v)),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Lista de itens'),
              const SizedBox(height: 8),
              ...List.generate(5, (i) {
                return GestureDetector(
                  onTap: () => _showDialog('Item ${i + 1}', 'Tocou no item ${i + 1}.'),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(child: Text('${i + 1}')),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('Item ${i + 1}'), const Text('Subtítulo')],
                        )
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Para simplificar a navegação de tabs em Cupertino, usamos CupertinoTabScaffold
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Conta'),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return _buildHomeContent();
        } else {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(middle: Text('Conta')),
            child: const Center(child: Text('Página de Conta (exemplo)')),
          );
        }
      },
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String text;
  const DetailsPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Detalhes')),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Texto transmitido: ${text.isEmpty ? "<vazio>" : text}'),
        ),
      ),
    );
  }
}
