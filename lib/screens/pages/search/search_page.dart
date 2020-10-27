import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/screens/widgets/general_filters.dart';

import 'get_data.dart';

class SearchPage extends StatefulWidget {

  String whereCame;

  SearchPage(this.whereCame);


  @override
  _SearchPageState createState() => _SearchPageState(whereCame);
}

class _SearchPageState extends State<SearchPage> {

  String whereCame;
  _SearchPageState(this.whereCame);



  List<Map<String, dynamic>> categories = [
    {
      'name': 'Promoções',
      'image': 'assets/fake_data/images/academia.jpeg',
    },
    {
      'name': 'Salões',
      'image': 'assets/fake_data/images/salon.jpg',
    },
    {
      'name': 'Academia',
      'image': 'assets/fake_data/images/academia.jpeg',
    },
    {
      'name': 'Restaurantes',
      'image': 'assets/fake_data/images/restaurant.jpg',
    },
    {
      'name': 'Academia',
      'image': 'assets/fake_data/images/academia.jpeg',
    },
    {
      'name': 'Salões',
      'image': 'assets/fake_data/images/salon.jpg',
    },
    {
      'name': 'Restaurantes',
      'image': 'assets/fake_data/images/restaurant.jpg',
    },
  ];
  List<String> buscasRecentes = ['Restaurante Klesliano','Salão Jacundesse','Academia Marobeiros'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: 190,
          ),
          Container(
            color: Colors.transparent,
            height: 170,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 110, 25, 5),
              child: TypeAheadField(
                hideOnEmpty: true,
                textFieldConfiguration: TextFieldConfiguration(
                    textAlign: TextAlign.center,
                    autofocus: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      labelText: 'Pesquisar',
                      labelStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                    )),
                suggestionsCallback: (pattern) async {
                  return await BackendService.getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: suggestion['categoryIcon'],
                    title: Text(suggestion['name']),
                    subtitle: Text(suggestion['category']),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  // O que acontece quando o usuário toca na sugestão
                },
              ),
            ),
          ),
          Positioned(
            top: 31,
            left: 4,
            child: whereCame == 'tab'?IconButton(
              color: Colors.white,
              icon: FaIcon(FontAwesomeIcons.bars),
              iconSize: 25.0,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ):IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back_ios_rounded),
              iconSize: 25.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 42,
            left: 70,
            child: Text(
              'O que deseja pesquisar?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(bottom: 15, top: 20),
                    child: Text(
                      'Buscas Recentes',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Column(children: buscasRecentes.map((busca) => ListTile(leading: Icon(Icons.settings_backup_restore),title: Text(busca),)).toList(),),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, top: 20),
                    child: Text(
                      'Categorias',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: 2,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,

                    children: categories
                        .map(
                          (category) => SizedBox(
                            height: 80,
                            width: 160,
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      category['image'],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,

                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                Center(
                                  child: Text(
                                    category['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
