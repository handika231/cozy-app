import 'package:cozy_app/config/app_style.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static const nameRoute = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _key1 = GlobalKey();

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
          Showcase(
            overlayPadding: const EdgeInsets.only(
              bottom: 36,
              top: -24,
              right: 8,
            ),
            contentPadding: const EdgeInsets.all(12),
            description: 'Tap to continue',
            key: _key1,
            showcaseBackgroundColor: Colors.indigo,
            descTextStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
            ),
            child: ElevatedButton(
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
                Navigator.pushReplacementNamed(context, HomePage.nameRoute);
              },
            ),
          ),
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
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          Future.delayed(const Duration(seconds: 2), () {
            ShowCaseWidget.of(context).startShowCase([_key1]);
          });
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
        },
      ),
    );
  }
}
