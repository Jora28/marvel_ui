import 'package:flutter/material.dart';


class CustumButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  final Color borderColor;
  final double radius;
  CustumButton({this.text, this.onTap,this.color,this.radius,this.borderColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                side: BorderSide(color:borderColor ),
                borderRadius: BorderRadius.circular(radius),
              )),
          child: Text(text),
          onPressed: onTap),
    );
  }
}
