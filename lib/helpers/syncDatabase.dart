import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<List<Map<String, dynamic>>> getUsersFromSQLite() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'my_database.db'),
  );

  final Database db = await database;
  final List<Map<String, dynamic>> pets = await db.query('pets');
  return pets;
}

Future<List<Map<String, dynamic>>> getProductsFromSQLite() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'my_database.db'),
  );

  final Database db = await database;
  final List<Map<String, dynamic>> vaccines = await db.query('vaccines');
  return vaccines;
}

void sendDataToBackend() async {
  try {
    final usersData = await getUsersFromSQLite();
    final productsData = await getProductsFromSQLite();

    await sendDataToAPI('users', usersData);
    await sendDataToAPI('products', productsData);

    print('Dados enviados com sucesso');
  } catch (e) {
    print('Erro ao enviar os dados: $e');
  }
}

Future<void> sendDataToAPI(String endpoint, List<Map<String, dynamic>> data) async {
  final response = await http.post(
    Uri.parse('https://api.com/$endpoint'),
    body: jsonEncode(data),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    print('Dados enviados com sucesso');
  } else {
    print('Erro ao enviar os dados');
  }
}
