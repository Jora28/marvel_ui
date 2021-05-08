import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_ui/widgets/style_color.dart';

class BasicDemo extends StatefulWidget {
  bool isFav;
  List<String> imageList;
  BasicDemo({this.isFav,this.imageList});
  @override
  _BasicDemoState createState() => _BasicDemoState();
}

class _BasicDemoState extends State<BasicDemo> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1.0,
                //enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height * 0.6,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: widget.imageList
                .map((item) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                item,
                              ),
                              fit: BoxFit.contain)),
                      // child: Image.network(
                      //   item,
                      //   fit: BoxFit.cover,
                      // )
                    ))
                .toList(),
          ),
          // Positioned(
          //     top: 30,
          //     right: 10,
          //     child: IconButton(
          //       icon: Icon(
          //           widget.isFav ? Icons.favorite : Icons.favorite_outline,
          //           color: Colors.white),
          //       onPressed: () {
          //         setState(() {
          //           widget.isFav = !widget.isFav;
          //         });
          //       },
          //     )),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageList.map((url) {
                int index = widget.imageList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? newColor4 : Colors.white),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
