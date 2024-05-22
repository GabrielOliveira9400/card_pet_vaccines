import 'package:card_pet_vaccines/ui/android/page/PetDetails.page.dart';
import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/models/pet.model.dart';
import 'package:card_pet_vaccines/ui/android/widget/ListPets.widget.dart';
import 'package:card_pet_vaccines/repositories/pet.repository.dart';
import 'package:provider/provider.dart';
class ListPets extends StatefulWidget {
  const ListPets({Key? key});

  @override
  State<ListPets> createState() => _ListPetsState();
}

class _ListPetsState extends State<ListPets> {
  late PetRepository petRepository;
  List<Pet> pets = [];

  @override
  Widget build(BuildContext context) {
    petRepository = Provider.of<PetRepository>(context);
    pets = petRepository.pet;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pets'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            if (pets.isNotEmpty)
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (Pet pet in pets)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetDetailPage(petId: pet.id!),
                        ),
                      );
                    },
                    child: ListPetsWidget(pet: pet),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
