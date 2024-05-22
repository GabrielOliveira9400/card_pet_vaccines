import 'package:card_pet_vaccines/ui/android/page/ListPets.page.dart';
import 'package:card_pet_vaccines/ui/android/page/Notification.page.dart';
import 'package:card_pet_vaccines/ui/android/page/RegisterPets.page.dart';
import 'package:flutter/material.dart';
import '../page/VaccineCat.page.dart';
import '../page/VacinaPet.page.dart';

class InicioWidget extends StatefulWidget {
  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      const Text('Olá, Seja Bem Vindo!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Text('Aqui você encontra informações sobre o seu pet, como vacinas, consultas e lembretes.',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterPetScreen(1)),
                                );
                              }, icon: const Icon(Icons.add),color: Colors.red,),
                              const Text('Adicionar Pet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListPets()),
                                );
                              }, icon: const Icon(Icons.pets),color: Colors.amber,),
                              const Text('Pets', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NotificationPage()),
                                );
                              }, icon: const Icon(Icons.notifications),color: Colors.blue,),
                              const Text('Notificações', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                    child: Text('Informações Úteis:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    //color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        //offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/viagemPet');
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/viagemPet.jpeg',
                              fit: BoxFit.cover),
                              const Text('Viagem com Pets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VaccinePage()),
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/vacina.jpeg',
                              fit: BoxFit.cover),
                              const Text('Vacinas para Cães', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VaccineCatPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/gato.jpeg',
                              fit: BoxFit.cover
                              ),
                              const Text('Vacina para Gatos', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cuidadosPet');
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/husky.png'),
                              const Text('Cuidados com seus Pets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/viagemPet');
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/viagemPet.jpeg'),
                              const Text('Viagem com Pets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/viagemPet');
                          },
                          child: Column(
                            children: [
                              Image.asset('assets/images/viagemPet.jpeg'),
                              const Text('Viagem com Pets', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}