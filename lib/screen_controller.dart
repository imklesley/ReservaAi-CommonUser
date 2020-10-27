import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:reserva_ai_common_user/screens/pages/home/home_page.dart';
import 'package:reserva_ai_common_user/screens/pages/notifications/notifications_page.dart';
import 'package:reserva_ai_common_user/screens/pages/schedules/schedules_page.dart';
import 'package:reserva_ai_common_user/screens/pages/search/search_page.dart';
import 'package:reserva_ai_common_user/screens/pages/user_settings/user_settings_page.dart';
import 'package:reserva_ai_common_user/screens/widgets/custom_drawer.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  //Lista de páginas do app
  List<Widget> _screenPages = [
    SearchPage('tab'),
    SchedulesPage(),
    HomePage(),
    NotificationsPage(),
    UserSettingsPage(),
    Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Salvos'),
      ),
      body: Center(
        child: Text(
          'Salvos',
          textScaleFactor: 4,
        ),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Estabelecimentos'),
      ),
      body: Center(
        child: Text(
          'Estabelecimentos',
          textScaleFactor: 4,
        ),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cupons'),
      ),
      body: Center(
        child: Text(
          'Procurar Cupons',
          textScaleFactor: 4,
        ),
      ),
    ),
  ];

  PageController _pageController = PageController(initialPage: 2);

  //Controle a mudança de páginas
  int _page = 2; //Para iniciar o bottomnavigator no centro.

  //A partir do index do item do bottomnavigator, retornar a page desejada
  void _pageChooser(int page) {
    //NÃO COLOCAR A POHA DE SETSTATE AQUI NUNCA
    switch (page) {
      case 0:
        _pageController.jumpToPage(0);
        break;
      case 1:
        _pageController.jumpToPage(1);
        break;

      case 2:
        _pageController.jumpToPage(2);
        break;

      case 3:
        _pageController.jumpToPage(3);
        break;

      default:
        _pageController.jumpToPage(4);
        break;
    }
  }

  //Configuração bottomnavigator
  Widget customCurvedNavBar() {
    // to hide only status bar:
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return CurvedNavigationBar(
        index: _page,
        animationDuration: Duration(milliseconds: 200),
        buttonBackgroundColor: Theme.of(context).primaryColor,
        color: Theme.of(context).primaryColor,
        height: 55,
        backgroundColor: Color.fromRGBO(253, 91, 62, 1),
        items: <Widget>[
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          FaIcon(
            FontAwesomeIcons.calendarCheck,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
//            print(index);
            _pageChooser(index);
            _page = index;
          });
        });
  }

  Future<LocationData> getCoordenates() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return _locationData;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return _locationData;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    Widget _pages = PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _screenPages);

    getCoordenates().then((coord) async{
      var adressess = await Geocoder.local.findAddressesFromCoordinates(Coordinates(coord.latitude,coord.longitude));
      print(adressess.first.adminArea);//Estado
      print(adressess.first.subAdminArea);//Cidade
      print(adressess.first.addressLine);//Endereço Completo
      print(adressess.first.countryName);//Nome do país
      print(adressess.first.postalCode);//Cep

    });
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: CustomDrawer(_pageController, _screenPages),
        body: DoubleBackToCloseApp(
          child: _pages,
          snackBar: const SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.black54,
            content: Text(
              'Pressione "voltar" mais uma vez para sair!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
        bottomNavigationBar: customCurvedNavBar());
  }
}
