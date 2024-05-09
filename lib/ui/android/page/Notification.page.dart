import 'package:card_pet_vaccines/ui/android/widget/Notification.widget.dart';
import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/models/notification.model.dart';


class NotificationPage extends StatelessWidget {

  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationPet> notifications = [
      NotificationPet(
        titulo: 'Check-up veterinário',
        mensagem: 'Lembrete: Rex precisa de um check-up veterinário anual.',
        lido: true,
        tipo: 'alerta'
      ),
      NotificationPet(
        titulo: 'Vacinação pendente',
        mensagem: 'Rex precisa receber a vacina contra raiva este mês.',
        lido: true,
        tipo: 'alerta'
      ),
      NotificationPet(
        titulo: 'Passeio diário',
        mensagem: 'Não se esqueça de levar Rex para passear hoje à tarde.',
        lido: false,
        tipo: 'lembrete'
      ),
      NotificationPet(
        titulo: 'Aniversário do Rex',
        mensagem: 'Hoje é o aniversário de 3 anos de Rex! 🎉',
        lido: false,
        tipo: 'informacao'
      )
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notificações'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var notification in notifications)
                   NotificationWidget(notification: notification)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
