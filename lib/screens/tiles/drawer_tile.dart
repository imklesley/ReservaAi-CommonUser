import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController pageController;
  final _screenPages;
  final int page;

  DrawerTile(
      this.icon, this.text, this.pageController, this._screenPages, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          color: pageController.page.round() == page
              ? Color.fromRGBO(253, 91, 62, 1)
              : Colors.transparent,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              children: [
                FaIcon(icon,
                    size: pageController.page.round() == page ? 25 : 22,
                    color: pageController.page.round() == page
                        ? Colors.white
                        : Colors.grey[200]),

                Spacer(),

                Text(
                  text,
                  style: TextStyle(
                      color: pageController.page.round() == page
                          ? Colors.white
                          : Colors.grey[200],
                      fontSize: pageController.page.round() == page ? 20 : 16,
                      fontWeight: pageController.page.round() == page
                          ? FontWeight.w900
                          : FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
                SizedBox(width: 20,)
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => _screenPages[page]));
        },
        highlightColor: Color.fromRGBO(253, 91, 62, 1),
      ),
    );
  }
}
