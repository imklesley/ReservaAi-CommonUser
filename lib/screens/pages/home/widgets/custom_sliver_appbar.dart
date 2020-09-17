import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/screens/pages/search/search_page.dart';
import 'package:reserva_ai_common_user/screens/pages/search/search_page_home.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  //Declara-se o atributo da altura que será passador por parâmetro
  final double expandedHeight;

  //Cria o construtor. Usa-se o operador "@required" para obrigar o usuário a inserir. Usamos chaves(var opcionais) para aide auto completar
  CustomSliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //shrinkOffset referencia o tamanho da Sliver em relação a ação do usuário
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        ClipRRect(
          //TROCAR AS IMAGENS DEPOOOOOIS, PEGAR DO FIREBASE
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          child: Image.asset(
            'assets/images/app_bar_image/sliverappbar_restaurant.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 78 - shrinkOffset / 4,
            //Isso é pra fazer o leading seguir o curso da SliverBar e ficar na posicao certinha
            left: 20,
            child: SizedBox(
              width: 50,
              child: IconButton(
                highlightColor: Colors.deepOrange,
                color: Colors.white,
                icon: FaIcon(FontAwesomeIcons.bars),
                iconSize: 25.0,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            )),
        Positioned(
          top: 150,
          left: 25,
          child: Opacity(
            opacity: (shrinkOffset / expandedHeight) < 0.1 ? 1 : 0,
            // se o shrinkOffeset estiver em 10% do expandedHeight a coluna desaparece

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Início',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'O que você precisa reservar?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 5,
          child: Opacity(
              opacity: shrinkOffset / expandedHeight, // quando
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logotypes/branco-laranja.png',
                    fit: BoxFit.cover,
                    height: 60,
                  ),
                  Container(
                    height: 50,
                    width: 60,
                    child: IconButton(
                      highlightColor: Color.fromRGBO(253, 91, 62, 1),
                      icon: Icon(
                        Icons.search,
                      ),
                      color: Colors.white,
                      iconSize: 25,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchPageHome();
                        }));
                      },
                    ),
                  )
                ],
              )),
        ),
        Positioned(
          top: expandedHeight / 1.12 - shrinkOffset,
          // Calculo realizado para colocar o search bar entre o sliver bar e o body
          left: MediaQuery.of(context).size.width / 18,
          child: Opacity(
              opacity: (1 - shrinkOffset / expandedHeight),
              child: Container(
                height: 45,
                width: 350,
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pesquisar',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                  //Vai ser trocado por um search
                  elevation: 10,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPageHome()));
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
              )),
        ),
      ],
    );
  }

  // Esses métodos precisam ser sobreescritos
  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  //esse verifica que o shrinkOffset foi alterado e reconstrói a tela
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
