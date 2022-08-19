import 'package:cozy_app/config/app_style.dart';
import 'package:flutter/material.dart';

import '../widgets/pupolar_cities_widget.dart';

class HomePage extends StatelessWidget {
  static const nameRoute = '/';
  const HomePage({Key? key}) : super(key: key);
  _headerContent() {
    return Container(
      margin: EdgeInsets.only(
        top: AppStyle.edge,
        left: AppStyle.edge,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Explore Now',
            style: AppStyle.blackTextStyle.copyWith(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Find rent house to stay and happy',
            style: AppStyle.greyTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  _popularCitiesContent() {
    return Container(
      margin: EdgeInsets.only(
        left: AppStyle.edge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Cities',
            style: AppStyle.blackTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                PopularWidget(
                  city: 'Jakarta',
                  image: '1',
                ),
                PopularWidget(
                  isFavorite: true,
                  city: 'Bandung',
                  image: '2',
                ),
                PopularWidget(
                  city: 'Surabaya',
                  image: '3',
                ),
                PopularWidget(
                  isFavorite: true,
                  city: 'Semarang',
                  image: '4',
                ),
                PopularWidget(
                  city: 'Bali',
                  image: '5',
                ),
                PopularWidget(
                  city: 'Malang',
                  image: '6',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            _headerContent(),
            _popularCitiesContent(),
          ],
        ),
      ),
    );
  }
}
