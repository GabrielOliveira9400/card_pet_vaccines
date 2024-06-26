import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../repositories/pet.repository.dart';
import '../../../models/pet.model.dart';

class EditPetScreen extends StatefulWidget {
  final int idDono;
  final int petId;

  const EditPetScreen(this.idDono, this.petId);

  @override
  _EditPetScreenState createState() => _EditPetScreenState();
}

class _EditPetScreenState extends State<EditPetScreen> {
  late PetRepository _petRepository;
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _racaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _dataNascimentoController =
  TextEditingController();
  final listGener = ['Macho', 'Fêmea'];
  DateTime _dataNascimentoSelecionada = DateTime.now();
  String genero = 'Macho';

  @override
  void initState() {
    super.initState();
    _petRepository = Provider.of<PetRepository>(context, listen: false);
    _loadData();
  }

  Future<void> _loadData() async {
    final Pet pet = await _petRepository.getPetById(widget.petId);

    setState(() {
      _nomeController.text = pet.name!;
      _tipoController.text = pet.type!;
      _racaController.text = pet.breed!;
      _pesoController.text = pet.weight.toString();
      _dataNascimentoController.text = pet.birthDate!;
      _dataNascimentoSelecionada = DateTime.parse(pet.birthDate!);
      genero = pet.gender!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Cadastro de Pet',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Crie o cadastro do seu pet!',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              controller: _nomeController,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite o nome do seu pet',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: Icon(Icons.pets),
                //errorText:
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              controller: _tipoController,
              decoration: const InputDecoration(
                labelText: 'Tipo do Animal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: Icon(Icons.pets),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              controller: _racaController,
              decoration: const InputDecoration(
                labelText: 'Raça do Animal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: Icon(Icons.pets),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              controller: _pesoController,
              decoration: const InputDecoration(
                labelText: 'Peso',
                suffixText: 'KG',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
            ),
            const SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _dataNascimentoController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                      labelText: 'Data de Nascimento',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      enabled: true,
                      //errorText: erroText,
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            DropdownButtonFormField<String>(
              value: genero,
              decoration: const InputDecoration(
                labelText: 'Gênero',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                prefixIcon: Icon(Icons.person),
              ),
              hint: const Text('Selecione o Gênero do Animal'),
              items: listGener.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  genero = _!;
                  ;});
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _savePet(context);
              },
              child: Text(
                'Cadastrar',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dataNascimentoSelecionada,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dataNascimentoSelecionada) {
      setState(() {
        _dataNascimentoSelecionada = picked;
        _dataNascimentoController.text =
        picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  void _savePet(BuildContext context) {
    final PetRepository petRepository =
    Provider.of<PetRepository>(context, listen: false);

    Pet updatedPet = Pet(
      id: widget.petId,
      userId: 1,
      name: _nomeController.text,
      type: _tipoController.text,
      breed: _racaController.text,
      weight: _pesoController.text,
      birthDate: _dataNascimentoController.text,
      gender: genero,
    );

    print('Saving Pet: ${updatedPet.toJson()}');

    petRepository.savePet(updatedPet).then((_) {
      Navigator.of(context).pop();
    });
  }
}
