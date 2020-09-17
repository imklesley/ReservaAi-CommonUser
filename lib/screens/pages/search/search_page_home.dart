import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          Container(color: Colors.transparent,
            height: 180,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 110, 25, 5),
              child: TypeAheadField(
                hideOnEmpty: true,
                textFieldConfiguration: TextFieldConfiguration(
                    autofocus: false,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontStyle: FontStyle.italic),
                    decoration: InputDecoration(
                      labelText: 'Pesquisar',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
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
          )
        ]));
  }
}
