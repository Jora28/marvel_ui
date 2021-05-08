import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  static final routeName = "SettingPage";
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _value = true;
  String _setName = "Русский";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 42),
            decoration: BoxDecoration(color: Colors.black),
            child: Column(children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      )),
                  Text(
                    "Настройки",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ])));
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/back.png"), fit: BoxFit.cover)),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          _listBuild(list.length, list),
          Center(
            child: Container(child: Image.asset('assets/hulk.png')),
          )
        ],
      ),
    );
  }

  seticon(name) {
    setState(() {
      _setName = name;
    });
  }

  Widget _listBuild(
    int length,
    List<Language> info,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  seticon(info[i].name);
                },
                child: Container(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          child: Text("${info[i].name}"),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.check,
                            color: info[i].name == _setName
                                ? Colors.green
                                : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}

class Language {
  String name;
  String image;

  Language(this.name, this.image);
}

List<Language> list = [
  Language("Английский", "assets/gb.png"),
  Language("Армянский", "assets/arm.png"),
];
