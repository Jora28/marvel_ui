import 'package:flutter/material.dart';
import 'inpurs.dart';

class AppBarSliver extends StatelessWidget {
  const AppBarSliver({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(color: Colors.black),
      child: Container(
        margin: EdgeInsets.only(top: 70,left: 10,right: 10),
        child: Container(
            child: CustomFormInput(
                prefix: Icons.search, hintText: "Search", obscureText: false)),
      ),
    );
  }
}
