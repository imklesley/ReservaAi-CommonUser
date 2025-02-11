import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reserva_ai_common_user/screens/pages/home/tiles/company_tile.dart';
import 'package:reserva_ai_common_user/screens/pages/home/tiles/company_tile_recomendations.dart';
import 'package:reserva_ai_common_user/screens/pages/home/widgets/custom_sliver_appbar.dart';
import 'package:reserva_ai_common_user/screens/widgets/general_filters.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          //AppBar com Sliver
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: CustomSliverAppBar(expandedHeight: 290),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: Text(
                'Recomendados',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: SizedBox(
                height: 226,
                child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.75),
                    //Tamanho dos botões de filtro altura/largura
                    children: [
                      CompanyTilePromotions(
                        tag: '1',
                        image: 'assets/fake_data/images/barbearia.jpg',
                        companyName: 'Barbearia Burguês Safado',
                        category: 'Restaurante',
                        iconCategory: Icons.local_dining,
                        location: 'Plano Diretor Sul, Palmas - TO',
                        rating: 3.5,
                      ),
                      CompanyTilePromotions(
                        tag: '2',
                        image: 'assets/fake_data/images/restaurant.jpg',
                        companyName: 'Madero Capim Dourado Shopping',
                        category: 'Restaurante',
                        iconCategory: Icons.local_dining,
                        location: 'Plano Diretor Sul, Palmas - TO',
                        rating: 3.5,
                      ),
                      CompanyTilePromotions(
                        tag: '3',
                        image: 'assets/fake_data/images/academia.jpeg',
                        companyName: 'Academia do Mateus',
                        iconCategory: Icons.transfer_within_a_station,
                        category: 'Restaurante',
                        location: 'Plano Diretor Sul, Palmas - TO',
                        rating: 4.5,
                      ),
                      CompanyTilePromotions(
                        tag: '4',
                        image: 'assets/fake_data/images/salon.jpg',
                        companyName: 'Salão Jacudá',
                        iconCategory: Icons.transfer_within_a_station,
                        category: 'Salão',
                        location: 'Plano Diretor Sul, Palmas - TO',
                        rating: 5.0,
                      )
                    ]),
              ),
            ),
          ),

          //Filtros gerais
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
              child: GeneralFilters(),
            ),
          ),

          //Tiles de Estabelecimentos
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.count(
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
          ),
        ],
      ),
    );
  }
}
