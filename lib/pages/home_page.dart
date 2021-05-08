import 'package:flutter/material.dart';
import 'package:marvel_ui/pages/all_charactars.dart';
import 'package:marvel_ui/pages/favorite_page.dart';

class HomePage extends StatefulWidget {
  static final routeName = "HomePageUser";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: sectionIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              label: "All Characters", icon: Icon(Icons.menu)),
          BottomNavigationBarItem(
              label: "Favorites", icon: Icon(Icons.favorite)),
        ],
        onTap: (index) {
          setState(() {
            sectionIndex = index;
          });
        },
      ),
      body: Container(
        child: _body(),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/back.png"), fit: BoxFit.cover)),
      ),
    );
  }

  Widget _body() {
    switch (sectionIndex) {
      case 0:
        return AllCharactersPage();
        break;
      case 1:
        return FavoritesPage();
        break;
      default:
        return AllCharactersPage();
    }
  }
}
