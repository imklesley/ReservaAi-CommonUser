import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reserva_ai_common_user/screens/pages/home/company_tabs.dart';

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

  IconData _iconSave = Icons.bookmark_border;

  _CompanyPageState(this.tag, this.image, this.companyName, this.category,
      this.iconCategory, this.location, this.rating, this.starsRating);

  @override
  Widget build(BuildContext context) {


     Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  transitionOnUserGestures: true,
                  tag: tag,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      //Coloquei usando mediaquery pra ajustar a sensibilidade a cada aparelho
                      if (details.delta.dy >= _size.height*0.007) {

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
                              dotIncreasedColor: Theme.of(context).primaryColor,
                              autoplay: false,
                              images: [
                                ColorFiltered(
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
                                        padding: const EdgeInsets.only(top: 5),
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
                child: CompanyTabs(),
              ),
              Container(
                  height: 350,
                  width: 350,
                  child: Card(
                    elevation: 5,
                    child: Form(
                      child: Padding(
                        padding:EdgeInsets.all(15),
                        child: Column(
                          children: [TextFormField()],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
