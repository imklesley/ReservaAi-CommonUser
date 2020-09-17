import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/screens/pages/notifications/tiles/notification_tile.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 110,
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
        body: ListView(
          children: [
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '18/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Colors.deepOrange,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '16/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Theme.of(context).primaryColor,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '18/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Colors.deepOrange,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '16/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Theme.of(context).primaryColor,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '18/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Colors.deepOrange,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '16/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Theme.of(context).primaryColor,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '18/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Colors.deepOrange,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '16/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Theme.of(context).primaryColor,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '18/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Colors.deepOrange,
              today: "16/09/2020",
            ),
            NotificationTile(
              title: 'Fica ligado !',
              message:
                  'Você marcou um horário em Salão Jacundá, não se atrase :)',
              dataSchedule: {
                'horario': '15:30',
                'data': '16/09/2020',
                'endereco': '106 Norte Alameda 1 Rio Negro'
              },
              backgroundColor: Theme.of(context).primaryColor,
              today: "16/09/2020",
            ),
          ],
        ));
  }
}
