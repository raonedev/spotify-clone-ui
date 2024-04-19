import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/catagory.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({super.key, required this.category});

  final Category category;
  Color getRandomColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    return Color.fromRGBO(red, green, blue, 1.0);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 120,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(category.imgUrl),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: getRandomColor(),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(3),bottomLeft: Radius.circular(3))
              ),
              height: 8,
            ),
          ),
          Positioned(
              top: 15,
              left: 25,
              right: 0,
              child: Text(
                category.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 0.60,
                ),
              )),
          const Positioned(
            left: -10,
            top: 10,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            right: -20,
            bottom: 10,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
