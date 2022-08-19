import 'package:flutter/material.dart';

import '../config/config.dart';

class PopularWidget extends StatelessWidget {
  final bool isFavorite;
  final String image, city;
  const PopularWidget({
    Key? key,
    required this.image,
    this.isFavorite = false,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppStyle.greyColor,
          width: 0.2,
        ),
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xffF6F7F8),
      ),
      height: 150,
      width: 120,
      margin: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
            child: Stack(children: [
              Image.asset(
                'assets/city$image.png',
                width: 120,
                height: 102,
                fit: BoxFit.cover,
              ),
              isFavorite
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppStyle.purpleColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                          ),
                        ),
                        child: Icon(
                          Icons.star,
                          color: AppStyle.orangeColor,
                          size: 22,
                        ),
                      ),
                    )
                  : const SizedBox()
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            city,
            style: AppStyle.blackTextStyle.copyWith(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
