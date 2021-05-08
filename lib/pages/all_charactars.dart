import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:marvel_ui/pages/character_info_page.dart';
import 'package:marvel_ui/widgets/character_card.dart';
import 'package:marvel_ui/widgets/sliverbar.dart';
import 'package:marvel_ui/widgets/style_color.dart';

class AllCharactersPage extends StatefulWidget {
  static final routeName = "AllCharactersPage";

  AllCharactersPage({Key key}) : super(key: key);

  @override
  _AllCharactersPageState createState() => _AllCharactersPageState();
}

class _AllCharactersPageState extends State<AllCharactersPage> {
  List<CardItem> cardsList = [
    CardItem(
        name: "Spider_Man(Msssssssssssssssssssssssssssssssssssssarvel Hero)",
        image: 'assets/card_img_1.png'),
    CardItem(name: "Spider", image: 'assets/card_img_2.png'),
    CardItem(name: "Spider", image: 'assets/card_img_3.png'),
    CardItem(name: "Spider", image: 'assets/card_img_4.png'),
    CardItem(name: "Spider", image: 'assets/card_img_1.png'),
    CardItem(name: "Spider", image: 'assets/card_img_2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Good morning,Jora",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              backgroundColor: Colors.black,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 120.0,
              flexibleSpace: FlexibleSpaceBar(
                background: AppBarSliver(),
              )),
        ];
      },
      body: Container(
        child: _body(),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/back.png"), fit: BoxFit.cover)),
      ),
    ));
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: cardsList.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            columnCount: 2,
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              horizontalOffset: 100.0,
              verticalOffset: 100.0,
              child: FadeInAnimation(
                child: OpenContainer(
                  closedColor: Colors.black,
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (contex, _) => CharacterInfoPage(),
                  transitionDuration: Duration(seconds: 1),
                  closedBuilder: (context, VoidCallback voidCallback) =>
                      CharacterCard(
                          onTap: voidCallback,
                          name: cardsList[index].name,
                          image: cardsList[index].image),
                  // child: CharacterCard(
                  //     onTap: () {
                  //       Navigator.of(context)
                  //           .pushReplacementNamed(CharacterInfoPage.routeName);
                  //     },
                  //     name: cardsList[index].name,
                  //     image: cardsList[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardItem {
  String name;
  String image;
  CardItem({this.name, this.image});
}
