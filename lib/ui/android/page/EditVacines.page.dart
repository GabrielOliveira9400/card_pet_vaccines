import 'package:card_pet_vaccines/repositories/vaccine.repository.dart';
import 'package:flutter/material.dart';
import '../../../models/vaccines.model.dart';

class RegisterVacinePage extends StatefulWidget {
  final int petIdVaccine;
  final Vaccines? vaccine; // Adicionando vacina como parâmetro opcional

  RegisterVacinePage({required this.petIdVaccine, this.vaccine});

  @override
  State<RegisterVacinePage> createState() => _EditVacinePageState();
}

class _EditVacinePageState extends State<RegisterVacinePage> {
  final TextEditingController _vacinenameController = TextEditingController();
  final TextEditingController _vaccineDescriptionController = TextEditingController();
  final TextEditingController _vaccineDateController = TextEditingController();
  final TextEditingController _validadeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.vaccine != null) {
      _vacinenameController.text = widget.vaccine!.name!;
      _vaccineDescriptionController.text = widget.vaccine!.description!;
      _vaccineDateController.text = widget.vaccine!.date!;
      _validadeController.text = widget.vaccine!.validade.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Cadastrar Vacina'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Cadastrar Vacina',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Crie o cadastro da vacina!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: _vacinenameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite o nome da vacina',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      suffixIcon: Icon(Icons.vaccines),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: _vaccineDescriptionController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      hintText: 'Digite a descrição da vacina',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      suffixIcon: Icon(Icons.description),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: _vaccineDateController,
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Data',
                      hintText: 'Digite a data da vacina',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      suffixIcon: Icon(Icons.date_range),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: _validadeController,
                    keyboardType: TextInputType.datetime,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Validade',
                      hintText: 'Digite a Validade da vacina',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      //suffixIcon:
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: () {
                      _registerVacine();
                    },
                    child: const Text('Cadastrar',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )
                ],
              ),

            ),
          ),
        ],
      ),
    );

  }

  void _registerVacine() {
    final VaccinesRepository repository = VaccinesRepository();
    final String name = _vacinenameController.text;
    final String description = _vaccineDescriptionController.text;
    final String date = _vaccineDateController.text;
    final String validade = _validadeController.text;

    if (name.isNotEmpty && description.isNotEmpty && date.isNotEmpty && validade.isNotEmpty) {
      final vaccine = Vaccines(
        id: widget.vaccine?.id, // Use the id if editing
        name: name,
        petId: widget.petIdVaccine,
        description: description,
        date: date,
        validade: int.parse(validade),
      );

      if (widget.vaccine == null) {
        repository.addVaccine(vaccine);
      } else {
        repository.updateVaccine(vaccine); // Add this function in the repository
      }

      Navigator.pop(context);
    }
  }
}
