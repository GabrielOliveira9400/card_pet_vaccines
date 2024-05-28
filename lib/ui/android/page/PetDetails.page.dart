import 'package:card_pet_vaccines/ui/android/page/RegisterVacines.page.dart';
import 'package:card_pet_vaccines/ui/android/widget/HeaderVaccines.widget.dart';
import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/models/vaccines.model.dart';
import 'package:card_pet_vaccines/ui/android/widget/ListVaccines.widget.dart';

import '../../../models/pet.model.dart';
import '../../../repositories/pet.repository.dart';
import '../../../repositories/vaccine.repository.dart';
import './EditPets.page.dart';
//import './page/EditPets.page.dart';

class PetDetailPage extends StatefulWidget {
  final int petId;

  PetDetailPage({required this.petId});
  @override
  _PetDetailPageState createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  late VaccinesRepository _vaccinesRepository;
  late PetRepository _petRepository;
  List<Vaccines> _vacinas = [];
  late Pet _pet;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _vaccinesRepository = VaccinesRepository();
    _petRepository = PetRepository();
    final int petId = widget.petId;
    List<Vaccines> vaccines = await _vaccinesRepository.getVaccinesByPetId(petId);
    final Pet pet = await _petRepository.getPetById(petId);
    setState(() {
      _vacinas = vaccines;
      _pet = pet;
    });
    print(_vacinas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPetScreen(1, widget.petId),
                ),
              );
              _loadData();
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterVacinePage(petIdVaccine: widget.petId),
                ),
              );
            },
            icon: Icon(Icons.add, color: Colors.blue),
          ),
        ],
      ),
      body: _vacinas == null
          ? Center(
        child: CircularProgressIndicator(), // Mostra um indicador de carregamento enquanto os dados são carregados
      )
          : SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              HeaderVaccines(pet: _pet),
              Divider(
                height: 20.0,
                color: Colors.grey,
                thickness: 2.0,
                indent: 16.0,
                endIndent: 16.0,
              ),
              Text(
                'Vacinas',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildListaVacinas(), // Suponho que você tenha um método para construir a lista de vacinas
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildListaVacinas() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          //print(_vacinas),
          for (Vaccines vacina in _vacinas)
            ListVaccines(vacina: vacina),
        ],),
    );
  }
}



