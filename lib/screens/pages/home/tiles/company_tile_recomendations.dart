import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reserva_ai_common_user/screens/pages/home/company_page.dart';

class CompanyTilePromotions extends StatelessWidget {
  final String image;
  final String companyName;
  final String category;
  final IconData iconCategory;
  final String location;
  final double rating;
  final String tag;

  CompanyTilePromotions(
      {this.image,
      this.companyName,
      this.category,
      this.iconCategory,
      this.location,
      this.rating,
      this.tag});

  Widget stars(nota, {bool companyPage = false}) {
    double sizeIcon = companyPage ? 30 : 20;

    //Estrelas inteiras
    int inteiras = nota.toInt();
    List<Widget> stars_list = [];
    for (int i = 0; i != inteiras; i++)
      stars_list.add(Icon(
        Icons.star,
        size: sizeIcon,
        color: Colors.amber,
      ));

    if ((nota - inteiras) != 0)
      stars_list.add(Icon(
        Icons.star_half,
        size: sizeIcon,
        color: Colors.amber,
      ));

    if (stars_list.length < 5)
      while (stars_list.length != 5)
        stars_list.add(Icon(
          Icons.star_border,
          size: sizeIcon,
          color: Colors.amber,
        ));

    return Row(
      children: stars_list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Card(margin: EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            shadowColor: Colors.black,
            elevation: 5,
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 500,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: stars(rating),
                  )
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          companyName,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(iconCategory, size: 16, color: Colors.black45),
                          Text(
                            category,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 16, color: Colors.black45),
                          Text(
                            location,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
        highlightColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CompanyPage(
                      tag,
                      image,
                      companyName,
                      category,
                      iconCategory,
                      location,
                      rating,
                      stars(rating, companyPage: true))));
        },
      ),
    );
  }
}
