import 'package:flutter/material.dart';

class FavIcon extends StatefulWidget {
  final Function onTap;

  FavIcon({this.onTap});

  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          iconSize: 35,
          onPressed: () {
            setState(() {
              isFav = !isFav;
            });
          },
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline),
          color: isFav ? Colors.red : Colors.white),
    );
  }
}
