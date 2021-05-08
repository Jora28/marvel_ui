import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:marvel_ui/pages/settings.dart';
import 'package:marvel_ui/widgets/dismis.dart';
import 'package:marvel_ui/widgets/favorite_card.dart';

class FavoritesPage extends StatefulWidget {
  static final routeName = "FavoritesPage";

  FavoritesPage({Key key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  double screenWidth;
  double screenHeight;
  final Duration duration = const Duration(milliseconds: 150);
  bool _isSideMenuOpen = true;
  List<String> listitem = [
    "Batmen",
    "SuperMan",
    "SpiderMan",
    "AquaMen",
    "IronMan",
    "Capitan America",
    "Hulk",
    "Doctor Strange",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/back.png"), fit: BoxFit.cover),
          ),
          child: Stack(children: [_sideMenu(), _body()])),
    );
  }

  Widget _sideMenu() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Container(
                      child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(8),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage("https://pin.it/1tV1zHs"),
                          )),
                      Container(
                          child: Text("Jora",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)))
                    ],
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        children: [
                          Container(
                              child: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                            size: 25,
                          )),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                "user.email",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context)=>SettingPage()));
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 25,
                          )),
                    ),
                    Text("Settings",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                )),
                InkWell(
                  // onTap: () async {
                  //   var singOut = await BeasyApi().profileServices.singOut();
                  //   if (singOut) {
                  //     SaveUserData.saveLogged(false);
                  //     Navigator.of(context).popAndPushNamed(OnBoard.routeName);
                  //   }
                  // },
                  child: Container(
                      child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 25,
                          )),
                      Text("Log out",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return AnimatedPositioned(
      duration: duration,
      top: _isSideMenuOpen ? 0 : 0.1 * screenHeight,
      bottom: _isSideMenuOpen ? 0 : 0.1 * screenWidth,
      left: _isSideMenuOpen ? 0 : 0.6 * screenWidth,
      right: _isSideMenuOpen ? 0 : -0.4 * screenWidth,
      child: Material(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/back.png"), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.5)),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isSideMenuOpen = !_isSideMenuOpen;
                                });
                              },
                            ),
                          ),
                          Container(
                            child: Text(
                              "Favorites",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 85),
                child: ListView.separated(
                    itemCount: listitem.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: DismissibleWidget(
                              item: listitem[index],
                              child: FavoriteCard(
                                name: listitem[index],
                              ),
                              onDismissed: (direction) =>
                                  dismissItem(context, index, direction),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dismissItem(
    BuildContext context,
    int index,
    DismissDirection direction,
  ) {
    setState(() {
      listitem.removeAt(index);
    });
  }
}
