import 'package:flutter/material.dart';
import 'package:marvel_ui/pages/all_charactars.dart';
import 'package:marvel_ui/pages/character_info_page.dart';
import 'package:marvel_ui/pages/favorite_page.dart';
import 'package:marvel_ui/pages/home_page.dart';
import 'package:marvel_ui/pages/on_board.dart';
import 'package:marvel_ui/pages/settings.dart';
import 'package:marvel_ui/pages/sign_in_page.dart';
import 'package:marvel_ui/pages/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: OnBoard.routeName,
      routes: {
        OnBoard.routeName:(c)=>OnBoard(),
        SignInPage.routeName:(c)=>SignInPage(),
        SignUpPage.routeName:(c)=>SignUpPage(),
        HomePage.routeName:(c)=>HomePage(),
        AllCharactersPage.routeName:(c)=>AllCharactersPage(),
        FavoritesPage.routeName:(c)=>FavoritesPage(),
        CharacterInfoPage.routeName:(c)=>CharacterInfoPage(),
        SettingPage.routeName:(c)=>SettingPage()
      },
    );
  }
}