import 'package:flutter/material.dart';
import 'Home.page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica de autenticação aqui
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomAppBarDemo(),
                  ),
                );
              },
              child: const Text('Entrar'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Adicione aqui a lógica para recuperação de senha
              },
              child: Text('Esqueci minha senha'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Adicione aqui a lógica de login com o Google
              },
              icon: Icon(Icons.login),
              label: Text('Login com Google'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Adicione aqui a lógica para criar uma nova conta
              },
              child: Text('Criar uma nova conta'),
            ),
          ],
        ),
      ),
    );
  }
}
