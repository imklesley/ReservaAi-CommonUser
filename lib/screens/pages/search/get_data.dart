import 'package:flutter/material.dart';

class BackendService {


  static Future<List> getSuggestions(
    String query,
  ) async {
    List<dynamic> data = [
      {
        'name': 'Restaurante Jacudá',
        'category': 'Restaurante',
        'categoryIcon': Icon(Icons.local_dining)
      }, {
        'name': 'Restaurante Mateus',
        'category': 'Restaurante',
        'categoryIcon': Icon(Icons.local_dining)
      },
      {
        'name': 'Restaurante Klesley',
        'category': 'Restaurante',
        'categoryIcon': Icon(Icons.local_dining)
      },
      {
        'name': 'Academia Jacudá',
        'category': 'Restaurante',
        'categoryIcon': Icon(Icons.local_dining)
      }, {
        'name': 'Academia Mateus',
        'category': 'Restaurante',
        'categoryIcon': Icon(Icons.local_dining)
      },
      {
        'name': 'Academia Klesley',
        'category': 'Restaurante',
        'categoryIcon': Icon(Icons.local_dining)
      }
    ];
    await Future.delayed(Duration(seconds: 1));


    data.sort((a,b){

      if(a['name'].contains(query) && !b['name'].contains(query))
        return -1;
      else if(!a['name'].contains(query) && b['name'].contains(query))
        return 1;
      else
        return 0;



    });

    return List.generate(3, (index) => data[index]);
  }
}
