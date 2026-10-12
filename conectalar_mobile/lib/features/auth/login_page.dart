
import 'package:flutter/material.dart';
import '../../core/api_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatelessWidget {
  final emailCtrl = TextEditingController();
  final senhaCtrl = TextEditingController();
  final api = ApiClient();
  final storage = FlutterSecureStorage();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.home_repair_service, size: 80, color: Colors.blue),
          Text('ConectaLar', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'E-mail')),
          TextField(controller: senhaCtrl, obscureText: true, decoration: InputDecoration(labelText: 'Senha')),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () async {
            var res = await api.dio.post('/auth/login', data: {'email': emailCtrl.text, 'senha': senhaCtrl.text});
            await storage.write(key: 'accessToken', value: res.data['token']);
            Navigator.pushReplacementNamed(context, '/home');
          }, child: Text('Entrar')),
        ]),
      ),
    );
  }
}
