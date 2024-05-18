import 'package:sqflite/sqflite.dart';
import '../helpers/database.dart';
import '../models/pet.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetRepository extends ChangeNotifier {
  late Database db;
  List<Pet> _pets = [];

  List<Pet> get pet => _pets;

  PetRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _getPets();
  }

  _getPets() async {
    db = (await DB.instance.database)!;
    List<Map<String, dynamic>> pets = await db.query('pets');
    _pets = pets.map((e) => Pet.fromJson(e)).toList();
    notifyListeners();
  }

  addPet(Pet newPet) async {
    await db.insert(
      'pets',
      newPet.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await _getPets();
  }

  removePet(int id) async {
    await db.delete(
      'pets',
      where: 'id = ?',
      whereArgs: [id],
    );
    await _getPets();
  }

  getPetById(int id) async {
    db = (await DB.instance.database)!;
    return Pet.fromJson((await db.query('pets', where: 'id = ?', whereArgs: [id]))[0]);
  }
}
