import 'package:flutter/material.dart';

import '../pages/character_info_page.dart';

class FavoriteCard extends StatefulWidget {
  final String name;
  FavoriteCard({this.name});

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
    //  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.black,
          // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.5)],
          //borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.grey, width: 0.6)),
      child: InkWell(
        onTap: () {
           Navigator.of(context).pushReplacementNamed(CharacterInfoPage.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(65)),
                          image: DecorationImage(
                              image: AssetImage("assets/desc_img.png"),
                              fit: BoxFit.cover)),
                    ),
                    Flexible(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              child: Text(
                                "Avanger Hero",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: InkWell(
              //     onTap: () {
              //       setState(() {
              //         if (value == false) {
              //           value = !value;
              //           // FavoriteCompanies.inserWidget(Text("111"));
              //           // print(FavoriteCompanies.faforiteList);
              //         } else {
              //           value = !value;
              //           // FavoriteCompanies.deletWidget();
              //           // print(FavoriteCompanies.faforiteList);
              //         }
              //       });
              //     },
              //     child: Container(
              //       margin: EdgeInsets.only(right: 10),
              //       child: Icon(
              //         value ? Icons.star : Icons.star_border_outlined,
              //         size: 30,
              //         color: value ? Colors.white : Colors.red,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
