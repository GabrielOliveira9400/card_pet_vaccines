class Vaccines {
  int? id;
  int? petId;
  String? name;
  String? description;
  String? date;
  String? validade;

  Vaccines(
      {this.id,
      this.petId,
      this.name,
      this.description,
      this.date,
      this.validade
      });


  Vaccines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petId = json['petId'];
    name = json['name'];
    description = json['description'];
    date = json['date'];
    validade = json['validade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['petId'] = this.petId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date'] = this.date;
    data['validade'] = this.validade;
    return data;
  }
}
