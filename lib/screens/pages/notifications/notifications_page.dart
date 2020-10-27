import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/screens/pages/notifications/tiles/notification_tile.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 20,
          shadowColor: Colors.black,
          title: Text(
            'Notificações',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          leading: IconButton(
            color: Colors.white,
            icon: FaIcon(FontAwesomeIcons.bars),
            iconSize: 25.0,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: [
              NotificationTile(
                title: 'https://image.freepik.com/vetores-gratis/modelo-do-logotipo-da-barbearia_1390-535.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '18/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://i.pinimg.com/originals/66/f9/70/66f970bda935c2a7ee8d87234c40bbd7.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '16/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://firebasestorage.googleapis.com/v0/b/reserva-ai.appspot.com/o/assets%2Fbrand%2Ficone-branco-laranja.png?alt=media&token=1959b19c-e449-48c0-81cc-5be7da47d536',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '18/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://i.pinimg.com/originals/66/f9/70/66f970bda935c2a7ee8d87234c40bbd7.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '16/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://firebasestorage.googleapis.com/v0/b/reserva-ai.appspot.com/o/assets%2Fbrand%2Ficone-laranja-branco.png?alt=media&token=e99851ab-1e01-4fee-b91e-be8eb4df3da9',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '18/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://i.pinimg.com/originals/66/f9/70/66f970bda935c2a7ee8d87234c40bbd7.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '16/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://image.freepik.com/vetores-gratis/modelo-do-logotipo-da-barbearia_1390-535.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '18/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://i.pinimg.com/originals/66/f9/70/66f970bda935c2a7ee8d87234c40bbd7.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '16/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://image.freepik.com/vetores-gratis/modelo-do-logotipo-da-barbearia_1390-535.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '18/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
              NotificationTile(
                title: 'https://i.pinimg.com/originals/66/f9/70/66f970bda935c2a7ee8d87234c40bbd7.jpg',
                message:
                    'Você marcou um horário em Salão Jacundá, não se atrase :)',
                dataSchedule: {
                  'horario': '15:30',
                  'data': '16/09/2020',
                  'endereco': '106 Norte Alameda 1 Rio Negro'
                },
                today: "16/09/2020",
              ),
            ],
          ),
        ));
  }
}
