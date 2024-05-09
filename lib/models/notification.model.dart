class NotificationPet {
  String? titulo;
  String? mensagem;
  bool? lido;
  String? tipo;

  NotificationPet({this.titulo, this.mensagem, this.lido, this.tipo});

  NotificationPet.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    mensagem = json['mensagem'];
    lido = json['lido'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['mensagem'] = this.mensagem;
    data['lido'] = this.lido;
    data['tipo'] = this.tipo;
    return data;
  }
}