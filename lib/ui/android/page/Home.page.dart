import 'package:card_pet_vaccines/ui/android/widget/inicio.widget.dart';
import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/ui/android/page/Notification.page.dart';
import 'package:card_pet_vaccines/ui/android/page/profile.page.dart';
import 'package:card_pet_vaccines/models/pet.model.dart';
import '../Page/ListPets.page.dart';
import '../Page/RegisterPets.page.dart';
import 'RegisterVacines.page.dart';


class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({Key? key});

  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    InicioWidget(),
    const ListPets(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAddPressed(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
      // Adicione aqui a ação para a tela Home
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPetScreen(1)),
        );
        break;
      case 2:
        break;
      case 3:
      // Desabilitar o botão
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavigationBarItem(Icons.home, 'Home', 0),
            _buildNavigationBarItem(Icons.pets, 'Pets', 1),
            _buildNavigationBarItem(Icons.notifications, 'Notifications', 2),
            _buildNavigationBarItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => _onAddPressed(context),
        child: const Icon(Icons.add, color: Colors.amber),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavigationBarItem(IconData icon, String label, int index) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => _onItemTapped(index),
      color: _selectedIndex == index ? Colors.blue : Colors.grey,
    );
  }
}

class AddPetScreen extends StatelessWidget {
  const AddPetScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet'),
      ),
      body: const Center(
        child: Text('Add Pet Screen'),
      ),
    );
  }
}

class AddVacineScreen extends StatelessWidget {
  const AddVacineScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vaccine'),
      ),
      body: const Center(
        child: Text('Add Vaccine Screen'),
      ),
    );
  }
}
