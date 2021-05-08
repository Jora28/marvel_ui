import 'package:flutter/material.dart';
import 'package:marvel_ui/pages/all_charactars.dart';
import 'package:marvel_ui/pages/home_page.dart';
import 'package:marvel_ui/utils.dart';
import 'package:marvel_ui/widgets/style_color.dart';

class CharacterInfoPage extends StatefulWidget {
  static final routeName = "CharacterInfoPage";
  CharacterInfoPage({Key key}) : super(key: key);

  @override
  _CharacterInfoPageState createState() => _CharacterInfoPageState();
}

class _CharacterInfoPageState extends State<CharacterInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Stack(
      children: [
        Flexible(
          child: ListView(
            padding: EdgeInsets.only(bottom: 100),
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //     bottomLeft: Radius.circular(20),
                        //     bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage('assets/desc_img.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 15,
                        top: MediaQuery.of(context).size.height * 0.45,
                        bottom: 15),
                    child: Text("Doctor Strange",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Text("Storyline",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(textDescription,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        ),
        Positioned(
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                     // .pushReplacementNamed(HomePage.routeName);
                },
              ),
              Text(
                "Back",
                style: TextStyle(color: Colors.white,fontSize: 24),
              )
            ],
          ),
          top: 30,
          left: 10,
        )
      ],
    );
  }
}
