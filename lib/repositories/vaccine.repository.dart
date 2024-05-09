import 'package:sqflite/sqflite.dart';
import '../helpers/database.dart';
import '../models/vaccines.model.dart';
import 'package:flutter/material.dart';

class VaccinesRepository extends ChangeNotifier {
  late Database db;
  List<Vaccines> _vaccines = [];

  List<Vaccines> get vaccines => _vaccines;

  VaccinesRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _getVaccines();
  }

  _getVaccines() async {
    db = (await DB.instance.database)!;
    List<Map<String, dynamic>> vaccines = await db.query('vaccines');
    _vaccines = vaccines.map((e) => Vaccines.fromJson(e)).toList();
    notifyListeners();
  }

  addVaccine(Vaccines newVaccine) async {
    print(newVaccine.toJson());
    db = (await DB.instance.database)!;
    await db.insert(
      'vaccines',
      newVaccine.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await _getVaccines();
  }

  removeVaccine(int id) async {
    await db.delete(
      'vaccines',
      where: 'id = ?',
      whereArgs: [id],
    );
    await _getVaccines();
  }

    Future<List<Vaccines>> getVaccinesByPetId(int petId) async {
     db = (await DB.instance.database)!;
     List<Map<String, dynamic>> vaccines = await db.query(
         'vaccines', where: 'petId = ?', whereArgs: [petId]);
     return vaccines.map((e) => Vaccines.fromJson(e)).toList();
   }
}