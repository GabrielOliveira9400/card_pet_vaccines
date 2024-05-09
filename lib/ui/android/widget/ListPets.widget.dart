import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/models/pet.model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../repositories/pet.repository.dart';

class ListPetsWidget extends StatefulWidget {
  final Pet pet;

  ListPetsWidget({super.key, required this.pet});
  @override
  State<ListPetsWidget> createState() => _ListPetsWidgetState();
}

class _ListPetsWidgetState extends State<ListPetsWidget> {
  Widget _buildInfoCard(String label, String info) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 70.0,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F2F7),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            info,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final idade = 5;
        //DateTime.now().year - int.parse(widget.pet.birthDate!.split('/')[2]);
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.30,
        children: [
          SlidableAction(
            label: 'Deletar',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) {
              Provider.of<PetRepository>(context, listen: false)
                  .removePet(widget.pet.id!);
            },
          ),
        ],
      ),
      child: Container(
        //height: 85,
        //width: double.infinity,
        margin: const EdgeInsets.only(top: 8),
        //color: Colors.blue,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.only(left: 5, right: 10),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/dog.png',
                width: 80.0, // Defina a largura desejada da imagem
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pet.name!,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.pet.breed!,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.pet.type ?? 'Tipo não informado',
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: <Widget>[
                      _buildInfoCard('Idade', idade.toString()),
                      _buildInfoCard(
                          'Sexo', widget.pet.gender ?? 'Não informado'),
                      _buildInfoCard('Peso', '${widget.pet.weight} Kg'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
