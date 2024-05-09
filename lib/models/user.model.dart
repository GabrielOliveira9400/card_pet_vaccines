import 'package:card_pet_vaccines/models/pet.model.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  List<Pet>? pets;

  User({this.id, this.name, this.email, this.password, this.pets});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    email = json['Email'];
    password = json['Password'];
    if (json['Pets'] != null) {
      pets = <Pet>[];
      json['Pets'].forEach((v) {
        pets!.add( Pet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Password'] = this.password;
    if (this.pets != null) {
      data['Pets'] = this.pets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
