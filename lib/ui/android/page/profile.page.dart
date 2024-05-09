import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Meu Perfil'),
        ),
        body: SizedBox(
          //alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://example.com/photo.jpg'), // Insira o URL da sua foto aqui
              ),
              const SizedBox(height: 20),
              const Text(
                'Seu Nome',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Sua Idade',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Text(
                'Seu Email',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Text(
                'Sua Localização',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Implemente aqui a lógica para sair do aplicativo
                },
                child: const Text('Sair do App'),
              ),
            ],
          ),
        ),
    );
  }
}