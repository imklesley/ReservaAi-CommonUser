import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reserva_ai_common_user/screens/pages/home/tiles/company_tile.dart';

class CompanyPage extends StatefulWidget {
  final String tag;
  final String image;
  final String companyName;
  final String category;
  final IconData iconCategory;
  final String location;
  final double rating;
  final Widget starsRating;

  CompanyPage(this.tag, this.image, this.companyName, this.category,
      this.iconCategory, this.location, this.rating, this.starsRating);

  @override
  _CompanyPageState createState() => _CompanyPageState(
      this.tag,
      this.image,
      this.companyName,
      this.category,
      this.iconCategory,
      this.location,
      this.rating,
      this.starsRating);
}

class _CompanyPageState extends State<CompanyPage> {
  final String tag;
  final String image;
  final String companyName;
  final String category;
  final IconData iconCategory;
  final String location;
  final double rating;
  final Widget starsRating;

  //Variáveis para montar o form de agendamento
  DateTime dateSelected = DateTime.now();
  TimeOfDay timeSelected = TimeOfDay.now();
  int numberSeats = 0;

  TextEditingController _datePickerController = TextEditingController();
  TextEditingController _timePickerController = TextEditingController();
  TextEditingController _numberSeatsPickerController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PageController _pageController = PageController(
    initialPage: 0,
  );

  //Inicia o saved assim
  IconData _iconSave = Icons.bookmark_border;

  //Para usar quando o usuário confirmar a reserva e estiver tudo verificado
  bool _done = false;

  _CompanyPageState(this.tag, this.image, this.companyName, this.category,
      this.iconCategory, this.location, this.rating, this.starsRating);

  //Lista que gerencia os filtros gerais. Cada palavra inserida, significa que irá ter um novo filtro na exibição da tela e na filtragem em SearchPage
  List<String> _companyTabs = [
    'Serviços',
    'Portifólio',
    'Profissionais',
    'Avaliações',
    'Sobre',
  ];

  //Para realizar a condicional em relação as cores de seleção, do filtros gerais
  String _marcado = 'Reservar';
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

//    Para não permitir o teclado abrir
//     FocusScope.of(context).requestFocus(new FocusNode()); Não mais necessário
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 20,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 290,
            centerTitle: true,
            // title: Text(companyName),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
                title: Text(companyName),
                background: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.modulate),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: 900,
            ),
          )
        ],
      ),
    );
  }
}
/*Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                    transitionOnUserGestures: true,
                    tag: tag,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        //Coloquei usando mediaquery pra ajustar a sensibilidade a cada aparelho
                        if (details.delta.dy >= _size.height * 0.007) {
                          //Se desceu 7 px logo ele sai da page da empresa
                          // É preciso tratar isso caso o usuário tenha começado a preencher algo, "Tem certeza que deseja voltar"
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                          height: 330,
                          child: Stack(
                            children: [
                              Carousel(
                                boxFit: BoxFit.cover,
                                dotSize: 5,
                                dotBgColor: Colors.transparent,
                                dotColor: Colors.white,
                                dotIncreasedColor:
                                    Theme.of(context).primaryColor,
                                autoplay: false,
                                images: [
                                  ColorFiltered(
                                    // Usado para dá uma tonalidade mais escura na imagem
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.modulate),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50)),
                                      child: Image.asset(
                                        image,
                                        fit: BoxFit.cover,
                                        height: 400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                  top: 31,
                                  left: 4,
                                  child: FlatButton(
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )),
                              //Save company
                              Positioned(
                                  top: 31,
                                  right: 4,
                                  child: FlatButton(
                                    child: Icon(
                                      _iconSave,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (_iconSave == Icons.bookmark_border) {
                                        print('marcar');
                                        setState(() {
                                          //1- Fazer verificação se o usuário está logado
                                          //2-Salvar id da empresa no documento do usuário
                                          //3-Agora muda o icone para preenchdo, isso tem que ser baseado em algum atributo do usuário
                                          _iconSave = Icons.bookmark;
                                        });
                                      } else {
                                        print('desmarcar');
                                        setState(() {
                                          //1- Fazer verificação se o usuário está logado
                                          //2-tirar id da empresa no documento do usuário
                                          //3-Agora muda o icone para n preenchido, isso tem que ser baseado em algum atributo do usuário
                                          _iconSave = Icons.bookmark_border;
                                        });
                                      }
                                    },
                                  )),
                              Positioned(
                                top: 100,
                                left: 40,
                                child: SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            companyName,
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 30),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: Icon(
                                                  iconCategory,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  category,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, right: 5),
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  location,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  right: 30,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      starsRating,
                                      Text(
                                        '$rating/5.0',
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Montserrat',
                                            color: Colors.amber,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ))
                            ],
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: SizedBox(
                    height: 40,
                    child: GridView(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.32),
                      //Tamanho dos botões de filtro altura/largura
                      children: _companyTabs.map((elemento) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 4, bottom: 8.0, right: 4),
                          child: RaisedButton(
                            highlightColor: Colors.deepOrange,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              elemento,
                              style: TextStyle(
                                  color: (_marcado == elemento) ||
                                          (_currentPage ==
                                              _companyTabs.indexOf(elemento))
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            color: (_marcado == elemento) ||
                                    (_currentPage ==
                                        _companyTabs.indexOf(elemento))
                                ? Colors.deepOrange
                                : Colors.white,
                            onPressed: elemento != _marcado
                                ? () {
                                    setState(() {
                                      //Muda depage
                                      _marcado = elemento;
                                      _currentPage =
                                          _companyTabs.indexOf(elemento);
                                      _pageController.jumpToPage(_currentPage);
                                    });
                                  }
                                : () {},
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                //Pages
                Container(
                  height: 380,
                  width: double.infinity,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (currentPage) {
                      setState(() {
                        _currentPage = currentPage;
                        _marcado = _companyTabs.elementAt(currentPage);
                      });
                    },
                    controller: _pageController,
                    children: [
                      GridView.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          //Coloquei uma tag aleatória para usar o random
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/restaurant.jpg',
                            companyName: 'Restaurante Klesliano',
                            category: 'Restaurante',
                            iconCategory: Icons.local_dining,
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 3.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/barbearia.jpg',
                            companyName: 'Barbearia Burguês Safado',
                            category: 'Restaurante',
                            iconCategory: Icons.local_dining,
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 3.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/academia.jpeg',
                            companyName: 'Academia do Mateus',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Restaurante',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 4.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/salon.jpg',
                            companyName: 'Salão Jacudá',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Salão',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 5.0,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/restaurant.jpg',
                            companyName: 'Restaurante Klesliano',
                            category: 'Restaurante',
                            iconCategory: Icons.local_dining,
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 3.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/academia.jpeg',
                            companyName: 'Academia do Mateus',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Restaurante',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 4.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/salon.jpg',
                            companyName: 'Salão Jacudá',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Salão',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 5.0,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/restaurant.jpg',
                            companyName: 'Restaurante Klesliano',
                            category: 'Restaurante',
                            iconCategory: Icons.local_dining,
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 3.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/academia.jpeg',
                            companyName: 'Academia do Mateus',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Restaurante',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 4.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/salon.jpg',
                            companyName: 'Salão Jacudá',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Salão',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 5.0,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/restaurant.jpg',
                            companyName: 'Restaurante Klesliano',
                            category: 'Restaurante',
                            iconCategory: Icons.local_dining,
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 3.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/academia.jpeg',
                            companyName: 'Academia do Mateus',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Restaurante',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 4.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/salon.jpg',
                            companyName: 'Salão Jacudá',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Salão',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 5.0,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/restaurant.jpg',
                            companyName: 'Restaurante Klesliano',
                            category: 'Restaurante',
                            iconCategory: Icons.local_dining,
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 3.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/academia.jpeg',
                            companyName: 'Academia do Mateus',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Restaurante',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 4.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/salon.jpg',
                            companyName: 'Salão Jacudá',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Salão',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 5.0,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/restaurant.jpg',
                            companyName: 'Restaurante Klesliano',
                            category: 'Restaurante',
                            iconCategory: Icons.local_dining,
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 3.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/academia.jpeg',
                            companyName: 'Academia do Mateus',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Restaurante',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 4.5,
                          ),
                          CompanyTile(
                            tag: Random().nextInt(1000).toString(),
                            image: 'assets/fake_data/images/salon.jpg',
                            companyName: 'Salão Jacudá',
                            iconCategory: Icons.transfer_within_a_station,
                            category: 'Salão',
                            location: 'Plano Diretor Sul, Palmas - TO',
                            rating: 5.0,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4,right: 4),
                        child: StaggeredGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          staggeredTiles: [
                            StaggeredTile.count(2, 1),
                            StaggeredTile.count(1, 1),
                            StaggeredTile.count(1, 2),
                            StaggeredTile.count(1, 1),
                            StaggeredTile.count(2, 2),
                          ],
                          children: [
                            ClipRRect(borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.network(
                                'https://static1.fiquediva.com.br/articles/4/18/69/4/@/144160-o-falso-moicano-no-cabelo-masculino-e-um-article_gallery_portrait-2.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.network(
                                'https://mhmcdn.ynvolve.net/?w=750&h=450&quality=90&clipping=landscape&url=//manualdohomemmoderno.com.br/files/2020/01/cortes-de-cabelos-masculinos-para-2020-cortes-de-cabelos-masculinos-para-2020-5.jpg&format=webp&hash=1f22ee0778e9fa1fbbab87e8bd2d4cfd376e007856422798cde32e4e487d4ced',
                                fit: BoxFit.cover,
                              ),
                            ),ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.network(
                                'https://mhmcdn.ynvolve.net/?w=750&h=750&quality=100&clipping=landscape&url=//mhmcdn.ynvolve.net/?w=750&h=450&quality=100&clipping=landscape&url=//manualdohomemmoderno.com.br/files/2018/09/cortes-de-cabelo-masculino-para-2019-cortes-de-cabelo-masculino-para-2019-1.jpg&format=webp&hash=20707c71ecfda41258ffc737ef44834ddd23e9b679c5f99553d8f34d87331758&format=webp&hash=b0926d2b3e799fe1ec276a8e17a537a34de3d07e4372a30b2251c37a69d259f2',
                                fit: BoxFit.cover,
                              ),
                            ),ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.network(
                                'https://static1.preparadopravaler.com.br/articles/6/32/77/6/@/139183-o-faux-hauk-ajuda-a-alongar-o-rosto-e-fi-660x0-1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.network(
                                'https://static1.fiquediva.com.br/articles/4/18/69/4/@/144160-o-falso-moicano-no-cabelo-masculino-e-um-article_gallery_portrait-2.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text('Profissionais'),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        child: Center(
                          child: Text('Avaliações'),
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text('Sobre'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (_done)
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.9),
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 100,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 30, top: 40),
                        child: Text(
                          'Sua reserva foi efetuada com sucesso!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 55,
                    left: _size.width / 4,
                    child: Container(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Text(
                          'Ir para início',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
        ]));*/
