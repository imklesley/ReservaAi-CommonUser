import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/screens/widgets/general_filters.dart';

import 'get_data.dart';

class SearchPageHome extends StatefulWidget {
  @override
  _SearchPageHomeState createState() => _SearchPageHomeState();
}

class _SearchPageHomeState extends State<SearchPageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            color: Colors.white,
          ),
          Container(
            height: 190,
            color: Theme.of(context).primaryColor,
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
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600,),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search,color: Colors.white,),

                      labelText: 'Pesquisar',
                      labelStyle: TextStyle(

                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(50)),
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
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
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
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                GeneralFilters(),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 240, top: 15),
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: FlatButton(
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.white,
                          ),
                          color: Colors.transparent,
                          onPressed: () {},
                          highlightColor: Theme.of(context).primaryColor,
                        )),
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: FlatButton(
                          child: Icon(
                            Icons.stars,
                            color: Colors.white,
                          ),
                          color: Colors.transparent,
                          onPressed: () {},
                          highlightColor: Theme.of(context).primaryColor,
                        )),
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: FlatButton(
                          child: Icon(
                            Icons.transfer_within_a_station,
                            color: Colors.white,
                          ),
                          color: Colors.transparent,
                          onPressed: () {},
                          highlightColor: Theme.of(context).primaryColor,
                        )),
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: FlatButton(
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.white,
                          ),
                          color: Colors.transparent,
                          onPressed: () {},
                          highlightColor: Theme.of(context).primaryColor,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
