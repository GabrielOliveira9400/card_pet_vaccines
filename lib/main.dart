import 'package:card_pet_vaccines/repositories/pet.repository.dart';
import 'package:card_pet_vaccines/ui/android/Page/Home.page.dart';
import 'package:card_pet_vaccines/ui/android/Page/Login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'ui/android/Page/RegisterPets.page.dart';
import 'ui/android/Page/ListPets.page.dart';

import 'dart:io' show Platform;

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => PetRepository(), child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoApp(
            title: 'Card Pet Vaccines',
            theme: CupertinoThemeData(
              primaryColor: Colors.green,
            ),
            home: BottomAppBarDemo(),
          )
        : MaterialApp(
            title: 'Card Pet Vaccines',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: const BottomAppBarDemo(),
          );
  }
}
