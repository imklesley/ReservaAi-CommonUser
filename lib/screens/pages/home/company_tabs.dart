import 'package:flutter/material.dart';



class CompanyTabs extends StatefulWidget {
  @override
  _CompanyTabsState createState() => _CompanyTabsState();
}

class _CompanyTabsState extends State<CompanyTabs> {
  //Lista que gerencia os filtros gerais. Cada palavra inserida, significa que irá ter um novo filtro na exibição da tela e na filtragem em SearchPage
  List<String> _CompanyTabs = [
    'Reservar',
    'Portifólio',
    'Profissionais',
    'Avaliações',
    'Sobre',
  ];

  //Para realizar a condicional em relação as cores de seleção, do filtros gerais
  String _marcado = 'Reservar';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: GridView(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10,
            childAspectRatio: 0.32),
        //Tamanho dos botões de filtro altura/largura
        children: _CompanyTabs.map((elemento) {
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
                    fontSize: 12.0,
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
    );
  }
}
