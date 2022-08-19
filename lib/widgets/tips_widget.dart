import 'package:flutter/material.dart';

import '../config/app_style.dart';

class TipsWidget extends StatelessWidget {
  final String text, image, date;
  const TipsWidget({
    Key? key,
    required this.date,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/tips$image.png',
          width: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppStyle.blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Updated $date',
              style: AppStyle.greyTextStyle,
            )
          ],
        ),
        const Spacer(),
        const Icon(Icons.navigate_next),
      ],
    );
  }
}
