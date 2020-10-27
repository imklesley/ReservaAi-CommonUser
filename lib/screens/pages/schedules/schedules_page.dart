import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SchedulesPage extends StatelessWidget {
  List<Map<String, dynamic>> reservations = [
    {
      'status': 'confirmed',
      'company_name': 'Salão Jacundasse',
      'products': [
        {
          'average_duration_in_minutes': 60,
          'price': 60,
          'name': 'Corte Masculino'
        }
      ],
      'date_and_time_reservation': '21/10/2020-21:40'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 20,
        shadowColor: Colors.black,
        title: Text(
          'Minhas Reservas',
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
      backgroundColor: Colors.white,
      body: ListView(padding: const EdgeInsets.all(8.0), children: [
        FittedBox(
          fit:BoxFit.cover,
          alignment: Alignment.topLeft,
          child: FittedBox(
          fit:BoxFit.cover,
          alignment: Alignment.topLeft,
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
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 120,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        'Confirmado',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Resturante Klesliano',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '106 Norte Alameda 1, Palmas',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ))
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hoje',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Text('23/10',
                                  style: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('às 19:30',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        ),
        FittedBox(
          fit:BoxFit.cover,
          alignment: Alignment.topLeft,
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
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 120,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        'Confirmado',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Resturante Klesliano',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '106 Norte Alameda 1, Palmas',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ))
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hoje',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Text('23/10',
                                  style: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('às 19:30',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        FittedBox(
          fit:BoxFit.cover,
          alignment: Alignment.topLeft,
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
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 120,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        'Confirmado',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Resturante Klesliano',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '106 Norte Alameda 1, Palmas',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ))
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hoje',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Text('23/10',
                                  style: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('às 19:30',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        FittedBox(
          fit:BoxFit.cover,
          alignment: Alignment.topLeft,
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
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 120,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        'Confirmado',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Resturante Klesliano',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '106 Norte Alameda 1, Palmas',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ))
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Hoje',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              Text('23/10',
                                  style: TextStyle(
                                      color: Theme.of(context).highlightColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('às 19:30',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

//SchedulePage Antigo
// class SchedulesPage extends StatefulWidget {
//   @override
//   _SchedulesPageState createState() => _SchedulesPageState();
// }
//
// class _SchedulesPageState extends State<SchedulesPage> {
//   bool ascending = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 110,
//         elevation: 20,
//         shadowColor: Colors.black,
//         centerTitle: true,
//         title: Text(
//           'Minha Agenda',
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//         leading: IconButton(
//           color: Colors.white,
//           icon: FaIcon(FontAwesomeIcons.bars),
//           iconSize: 25.0,
//           onPressed: () {
//             Scaffold.of(context).openDrawer();
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: DataTable(
//                 sortAscending: ascending,
//                 sortColumnIndex: 0,
//                 dataRowHeight: 60,
//                 // columnSpacing: size.width / 5,
//                 columns: [
//                   DataColumn(
//                       onSort: (index, ascend) {
//                         setState(() {
//                           ascending = ascend;
//                         });
//                       },
//                       label: Text(
//                         'Reserva',
//                         style: TextStyle(fontSize: 18),
//                       )),
//                   DataColumn(
//                       label: Text(
//                     '',
//                   ))
//                 ],
//                 rows: [
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(Text(
//                       'Concluido',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(Text(
//                       'Concluido',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(Text(
//                       'Concluido',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(Text(
//                       'Concluido',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(Text(
//                       'Concluido',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(
//                       FlatButton(
//                         color: Theme.of(context).highlightColor,
//                         highlightColor: Theme.of(context).primaryColor,
//                         padding: EdgeInsets.zero,
//                         child: Text('Cancelar',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500)),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(Text(
//                       'Concluido',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//                   ]),
//                   DataRow(cells: [
//                     DataCell(
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Restaurante Klesliano',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w500)),
//                           Text(
//                             '23/11/2020 às 20:30',
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
//                           )
//                         ],
//                       ),
//                     ),
//                     DataCell(Text(
//                       'Concluido',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     )),
//                   ]),
//                 ]),
//           )),
//     );
//   }
// }
