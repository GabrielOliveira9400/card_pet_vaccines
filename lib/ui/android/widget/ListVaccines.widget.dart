import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/models/vaccines.model.dart';

import '../page/EditVacines.page.dart';

class ListVaccines extends StatefulWidget {
  final Vaccines vacina;
  const ListVaccines({super.key, required this.vacina});

  @override
  State<ListVaccines> createState() => _ListVaccinesState();
}

class _ListVaccinesState extends State<ListVaccines> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterVacinePage(
              petIdVaccine: widget.vacina.petId!,
              vaccine: widget.vacina, // Passando a vacina para edição
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 4.0),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
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
              'Meses de validade: ${widget.vacina.validade.toString()}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
