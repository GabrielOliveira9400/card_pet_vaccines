import 'package:card_pet_vaccines/models/vaccines.model.dart';

class Pet {
  int? id;
  int? userId;
  String? name;
  String? type;
  String? birthDate;
  String? gender;
  String? weight;
  String? description;
  String? picture;
  String? breed;


  Pet(
      {this.id,
      this.userId,
      this.name,
      this.type,
      this.birthDate,
      this.gender,
      this.weight,
      this.description,
      this.picture,
      this.breed
      });

  Pet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    type = json['type'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    weight = json['weight'];
    description = json['description'];
    picture = json['picture'];
    breed = json['breed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['Picture'] = this.picture;
    data['breed'] = this.breed;
    return data;
  }
}