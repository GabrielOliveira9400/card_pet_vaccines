import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../repositories/pet.repository.dart';
import '../../../models/pet.model.dart';

class RegisterPetScreen extends StatefulWidget {
  final int idDono;

  const RegisterPetScreen(this.idDono, {Key? key}) : super(key: key); // Correção na chamada do construtor

  @override
  _RegisterPetScreenState createState() => _RegisterPetScreenState();
}

class _RegisterPetScreenState extends State<RegisterPetScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _racaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _dataNascimentoController =
  TextEditingController();
  final listGener = ['Macho', 'Fêmea'];
  DateTime _dataNascimentoSelecionada = DateTime.now();
  String genero = 'Macho';
  XFile? _image;
  late String image;

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
            GestureDetector(
              onTap: () {
                selecionarFoto();
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: _image != null
                      ? DecorationImage(
                    image: FileImage(File(_image!.path)),
                    fit: BoxFit.cover,
                  )
                      : null,
                  color: Colors.grey[300], // Background color when no image is selected
                ),
                child: _image == null
                    ? Center(
                  child: Text(
                    'Selecione uma imagem',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    : null,
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
                _registerPet(context);
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

  selecionarFoto() {
    final ImagePicker _picker = ImagePicker();
    try {
      _picker.pickImage(source: ImageSource.gallery).then((file) {
        if (file != null) {
          setState(() {
            image = file.path;
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _registerPet(BuildContext context) {
    final PetRepository petRepository =
    Provider.of<PetRepository>(context, listen: false);

    // Criar um novo pet com os dados do formulário
    // Substitua "null" pelos valores corretos dos campos do formulário
    Pet newPet = Pet(
      userId: 1,
      name: _nomeController.text,
      type: _tipoController.text,
      birthDate: _dataNascimentoController.text,
      gender: genero,
      weight: _pesoController.text,
      description: '',
      picture: image,
      breed: _racaController.text,
      //vaccines: [],
    );

    // Adicionar o novo pet ao repositório
    petRepository.addPet(newPet);

    // Voltar para a tela anterior
    Navigator.pop(context);
  }
}
