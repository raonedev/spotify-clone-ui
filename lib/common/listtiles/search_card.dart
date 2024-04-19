import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/models/search_card_model.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.searchCardModel});
  final SearchCardModel searchCardModel;
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
      height: 100,
      decoration: BoxDecoration(
        color: getRandomColor(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -5,
            right: -40,
            child: Transform(
              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.48),
              child: Container(
                width: 85,
                height: 85,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(searchCardModel.imgUrl),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: SizedBox(
              width: 80,
              child: Text(
                searchCardModel.title,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
