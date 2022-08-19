import 'package:flutter/material.dart';

import '../config/config.dart';

class FacilityWidget extends StatelessWidget {
  final String image, numbersOfItem;
  const FacilityWidget({
    Key? key,
    required this.image,
    required this.numbersOfItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/icon_$image.png',
          width: 32,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          numbersOfItem,
          style: AppStyle.greyTextStyle,
        ),
      ],
    );
  }
}
