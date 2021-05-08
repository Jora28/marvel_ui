import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_ui/pages/sign_in_page.dart';
import 'package:marvel_ui/widgets/buttons.dart';
import 'package:marvel_ui/widgets/carusel.dart';
import 'package:marvel_ui/widgets/style_color.dart';

class OnBoard extends StatefulWidget {
  static final routeName = 'OnBoard';
  OnBoard({Key key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/back.png"), fit: BoxFit.cover)),
        child: _body(),
      ),
    );
  }

  bool isFaforite = false;
  int _current = 0;

  final List<String> imgList = [
    "assets/on_board.png",
    "assets/card_img_1.png",
    "assets/card_img_2.png",
  ];

  Widget _body() {
    return Container(
      height: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
               // enlargeCenterPage: false,
                height: MediaQuery.of(context).size.height * 0.6,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: imgList
                .map((item) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                item,
                              ),
                              fit: BoxFit.cover)),
                      // child: Image.network(
                      //   item,
                      //   fit: BoxFit.cover,
                      // )
                    ))
                .toList(),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.65),
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Text(
                "Welcome to the Marvel Universe",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? Colors.red : null),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            height: 44,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.85,
                left: 80,
                right: 80),
            child: CustumButton(
              borderColor:onBoardButtonBorderColor,
              color:onBoardButtonColor,
              radius: 0.0,
              onTap: () {
                Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
              },
              text: 'Skip',
            ),
          )
        ],
      ),
    );
  }
}
