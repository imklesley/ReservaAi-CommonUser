import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../company_page.dart';

class CompanyTile extends StatelessWidget {
  final String image;
  final String companyName;
  final String category;
  final IconData iconCategory;
  final String location;
  final double rating;
  final String tag;

  CompanyTile(
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
    return InkWell(
      child: Card(
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
                      height: 130,
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
                    Text(
                      companyName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        Icon(iconCategory, size: 10, color: Colors.black45),
                        Text(
                          category,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 7,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 10, color: Colors.black45),
                        Text(
                          location,
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 7,
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
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () {
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
    );
  }
}
