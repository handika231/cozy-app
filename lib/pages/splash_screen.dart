import 'package:cozy_app/config/app_style.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  //create constructor
  static const nameRoute = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  Widget _headerContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
        left: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            width: 50,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Find Cozy House\nto Stay and Happy',
            style: AppStyle.blackTextStyle.copyWith(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Stop membuang banyak waktu\npada tempat yang tidak habitable',
            style: AppStyle.greyTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppStyle.purpleColor,
              fixedSize: const Size(210, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            child: Text(
              'Explore Now',
              style: AppStyle.whiteTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.nameRoute);
            },
          )
        ],
      ),
    );
  }

  Widget _footerContent() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/splash_image.png',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _headerContent(context),
            _footerContent(),
          ],
        ),
      ),
    );
  }
}
