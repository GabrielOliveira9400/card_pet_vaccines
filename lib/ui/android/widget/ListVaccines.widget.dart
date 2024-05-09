import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/models/vaccines.model.dart';

class ListVaccines extends StatefulWidget {
  final Vaccines vacina;
  const ListVaccines({super.key, required this.vacina});

  @override
  State<ListVaccines> createState() => _ListVaccinesState();
}

class _ListVaccinesState extends State<ListVaccines> {
  @override
  Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 4.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.vacina.name!,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Data de aplicação: ${widget.vacina.date}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Meses de validade: ${widget.vacina.validade}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      );
    }
}
