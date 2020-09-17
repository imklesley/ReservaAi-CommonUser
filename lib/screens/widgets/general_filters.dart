import 'package:flutter/material.dart';

class GeneralFilters extends StatefulWidget {
  @override
  _GeneralFiltersState createState() => _GeneralFiltersState();
}

class _GeneralFiltersState extends State<GeneralFilters> {
  //Lista que gerencia os filtros gerais. Cada palavra inserida, significa que irá ter um novo filtro na exibição da tela e na filtragem em SearchPage
  List<String> _generalFilters = [
    'Todos',
    'Abertos',
    'Recentes',
    'Populares',
    'Proximos',
  ];

  //Para realizar a condicional em relação as cores de seleção, do filtros gerais
  String _marcado = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40,
        child: GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10,
              childAspectRatio: 0.38),
          //Tamanho dos botões de filtro altura/largura
          children: _generalFilters.map((elemento) {
            return Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8.0, right: 4),
              child: RaisedButton(
                highlightColor: Colors.deepOrange,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  elemento,
                  style: TextStyle(
                      color:
                          _marcado == elemento ? Colors.white : Colors.grey,
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                color:
                    _marcado == elemento ? Colors.deepOrange : Colors.white,
                onPressed: elemento == _marcado
                    ? () {
                        setState(() {
                          //Realização da chamada para o filtro
                        });
                        //Realiza buscas no filtro
                      }
                    : () {
                        setState(() {
                          _marcado = elemento;
                        });
                      },
              ),
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
