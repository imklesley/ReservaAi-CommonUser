import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  final String title;
  final String message;
  final Map<String, dynamic> dataSchedule;
  final String today;

  NotificationTile({this.title, this.message, this.dataSchedule, this.today});

  @override
  _NotificationTileState createState() => _NotificationTileState(
      this.title, this.message, this.dataSchedule, this.today);
}

class _NotificationTileState extends State<NotificationTile> {
  final String title;
  final String message;
  final Map<String, dynamic> dataSchedule;
  final String today;
  double _heightCard = 150;

  _NotificationTileState(
      this.title, this.message, this.dataSchedule, this.today);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: () {},
        child: Container(
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).highlightColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                width: 140,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    'Reserva Próxima',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Alguma mensagem sobre\npromoções ou reservas',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          left: 4,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Toque para mais informações ',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 12,
                              )
                            ],
                          ))
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    height: double.infinity,
                    width: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: ClipRRect(
                          borderRadius:  BorderRadius.all(Radius.circular(20)),
                          child: Image.network(title,
                      fit: BoxFit.cover,
                      height: 120,
                            // width: 250,
                    ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Card(
          color: Colors.transparent,
          elevation: 10,
          child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(7, 50, 73, 1),
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
                              color: Theme.of(context).highlightColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ))
                      ]),
                ),
                Divider(color: Colors.white,),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, bottom: 30, right: 10),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ]))),
    );*/
