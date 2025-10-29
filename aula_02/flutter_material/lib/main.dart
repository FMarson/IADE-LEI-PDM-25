import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialDemoApp());
}

class MaterialDemoApp extends StatelessWidget {
  const MaterialDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Material',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MaterialHomePage(),
    );
  }
}

class MaterialHomePage extends StatefulWidget {
  const MaterialHomePage({super.key});

  @override
  State<MaterialHomePage> createState() => _MaterialHomePageState();
}

class _MaterialHomePageState extends State<MaterialHomePage> {
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
      MaterialPageRoute(builder: (_) => DetailsPage(text: _nameController.text)),
    );
  }

  Future<void> _showDialog(String title, String content) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Fechar')),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text('Demo Material', style: textTheme.titleLarge),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome', hintText: 'Digite o seu nome'),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _showDialog('Olá', 'Este é um diálogo Material.'),
                  child: const Text('Mostrar diálogo'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: _openDetails,
                  child: const Text('Ir para detalhes'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text(_nameController.text.isEmpty ? 'Utilizador anónimo' : _nameController.text),
              subtitle: const Text('Exemplo de card/list tile'),
              trailing: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () => _showDialog('Info', 'Detalhes do utilizador (exemplo).'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Progresso: ${(_progress * 100).round()}%'),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: _progress),
          Slider(value: _progress, onChanged: (v) => setState(() => _progress = v)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Ativar notificações'),
              Switch(value: _notifications, onChanged: (v) => setState(() => _notifications = v)),
            ],
          ),
          const SizedBox(height: 16),
          Text('Lista de itens', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          ...List.generate(5, (i) {
            return ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text('Item ${i + 1}'),
              subtitle: const Text('Subtítulo'),
              onTap: () => _showDialog('Item ${i + 1}', 'Tocou no item ${i + 1}.'),
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fab = FloatingActionButton(
      onPressed: () => _showDialog('Ação Rápida', 'Clicou na FAB.'),
      child: const Icon(Icons.add),
    );

    final body = _selectedIndex == 0
        ? _buildHomeContent()
        : const Center(child: Text('Página de Conta (exemplo)'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Material'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => _showDialog('Ajuda', 'Exemplo de ajuda na app Material.'),
          )
        ],
      ),
      body: body,
      floatingActionButton: fab,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String text;
  const DetailsPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Texto transmitido: ${text.isEmpty ? "<vazio>" : text}'),
        ),
      ),
    );
  }
}
