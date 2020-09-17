import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  final String title;
  final String message;
  final Map<String, dynamic> dataSchedule;
  final Color backgroundColor;
  final String today;

  NotificationTile(
      {this.title,
      this.message,
      this.dataSchedule,
      this.backgroundColor,
      this.today});

  @override
  _NotificationTileState createState() => _NotificationTileState(this.title,
      this.message, this.dataSchedule, this.backgroundColor, this.today);
}

class _NotificationTileState extends State<NotificationTile> {
  final String title;
  final String message;
  final Map<String, dynamic> dataSchedule;
  final Color backgroundColor;
  final String today;
  bool _isExpanded = false;
  double _heightCard = 220;

  _NotificationTileState(this.title, this.message, this.dataSchedule,
      this.backgroundColor, this.today);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Card(
          color: Colors.transparent,
          elevation: 10,
          child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: _heightCard,
              width: 300,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(today,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                ),
                Divider(color: Theme.of(context).primaryColor, height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, bottom: 30, right: 10),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                ExpansionPanelList(
                  dividerColor: Colors.teal,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      if (isExpanded) {
                        _isExpanded = false;
                        _heightCard = 290;
                      } else {
                        _isExpanded = true;
                        _heightCard = 440;
                      }
                    });
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: _isExpanded,
                      canTapOnHeader: true,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text('Mais Informações'),
                        );
                      },
                      body: Column(
                        children: [
                          ListTile(
                            title: Text('Data'),
                            subtitle: Text(dataSchedule["data"]),
                          ),
                          ListTile(
                            title: Text('Horário'),
                            subtitle: Text(dataSchedule["horario"]),
                          ),
                          ListTile(
                            title: Text('Endereço'),
                            subtitle: Text(dataSchedule["endereco"]),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ]))),
    );
  }
}
