import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  final _formKey = GlobalKey<FormState>();
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
    if (_formKey.currentState?.validate() ?? false) {
      final user = _userCtrl.text.trim();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registrado: $user')),
      );
      // limpar campos
      _userCtrl.clear();
      _emailCtrl.clear();
      _passCtrl.clear();
      _confirmCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userCtrl,
                decoration: const InputDecoration(labelText: 'Usuário'),
                validator: (v) => (v == null || v.trim().length < 3) ? 'mínimo 3 caracteres' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'informe o email';
                  final re = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                  return re.hasMatch(v.trim()) ? null : 'email inválido';
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (v) => (v == null || v.length < 6) ? 'mínimo 6 caracteres' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _confirmCtrl,
                decoration: const InputDecoration(labelText: 'Confirmar senha'),
                obscureText: true,
                validator: (v) => (v != _passCtrl.text) ? 'senhas diferentes' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
