import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _userCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final user = _userCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final pass = _passCtrl.text;
    final confirm = _confirmCtrl.text;


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Usuário: $user | Email: $email | Senha: $pass | Senha-confirm: $confirm')),
    );

    // Limpar campos
    _userCtrl.clear();
    _emailCtrl.clear();
    _passCtrl.clear();
    _confirmCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro (sem validação)'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _userCtrl, decoration: const InputDecoration(labelText: 'Usuário')),
            const SizedBox(height: 8),
            TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 8),
            TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
            const SizedBox(height: 8),
            TextField(controller: _confirmCtrl, decoration: const InputDecoration(labelText: 'Confirmar senha'), obscureText: true),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submit, child: const Text('Registar')),
          ],
        ),
      ),
    );
  }
}
