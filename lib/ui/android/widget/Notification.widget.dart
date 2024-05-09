import 'package:flutter/material.dart';
import 'package:card_pet_vaccines/models/notification.model.dart';

class NotificationWidget extends StatefulWidget {

  final NotificationPet notification;
  NotificationWidget({super.key, required this.notification});
  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  //String? get titulo => null;
  //String? get mensagem => null;


  @override
  Widget build(BuildContext context) {
    var lido = widget.notification.lido;
    return Card(
      child: Stack(
        children: [
          ListTile(
            leading: Icon(
              (() {
                switch (widget.notification.tipo) {
                  case 'alerta':
                    return Icons.warning;
                  case 'informacao':
                    return Icons.info;
                  default:
                    return Icons.notifications;
                }
              }()),
              color: (() {
                switch (widget.notification.tipo) {
                  case 'alerta':
                    return Colors.red;
                  case 'informacao':
                    return Colors.blue;
                  default:
                    return Colors.green;
                }
              }()),
            ),
            title: Text(widget.notification.titulo!),
            subtitle: Text(widget.notification.mensagem!),
            //trailing: Icon(Icons.more_vert),
            //isThreeLine: true,
          ),
          lido == false
              ? Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Novo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
