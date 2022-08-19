import 'package:cozy_app/config/app_style.dart';
import 'package:cozy_app/config/config.dart';
import 'package:cozy_app/model/space/space.dart';
import 'package:cozy_app/pages/detail_page.dart';
import 'package:cozy_app/service/api_service.dart';
import 'package:flutter/material.dart';

import '../widgets/pupolar_cities_widget.dart';
import '../widgets/tips_widget.dart';

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
        bottom: 30,
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

  _recommendedContent() {
    return Container(
      margin: EdgeInsets.only(
        left: AppStyle.edge,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Recommended Space',
            style: AppStyle.blackTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          FutureBuilder(
            future: ApiService.getData(),
            initialData: const [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Space space = snapshot.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailPage.routeName,
                        arguments: space,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: AppStyle.edge,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: SizedBox(
                              width: 130,
                              height: 110,
                              child: Stack(
                                children: [
                                  Image.network(
                                    space.imageUrl.toString(),
                                    width: 130,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 70,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppStyle.purpleColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                            AppStyle.edge,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppStyle.orangeColor,
                                            size: 18,
                                          ),
                                          Text(
                                            '${space.rating}/5',
                                            style: AppStyle.whiteTextStyle
                                                .copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  space.name.toString(),
                                  style: AppStyle.blackTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price} ',
                                    style: AppStyle.purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '/ month',
                                        style: AppStyle.greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '${space.city}, ',
                                    style: AppStyle.greyTextStyle.copyWith(),
                                    children: [
                                      TextSpan(
                                        text: '${space.country}',
                                        style:
                                            AppStyle.greyTextStyle.copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _tipsContent() {
    return Container(
      margin: EdgeInsets.only(
        left: AppStyle.edge,
        bottom: 50,
        right: AppStyle.edge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Tips & Guidance',
            style: AppStyle.blackTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          const TipsWidget(
            image: '1',
            text: 'City Guidelines',
            date: '20 Apr',
          ),
          const SizedBox(
            height: 20,
          ),
          const TipsWidget(
            image: '2',
            text: 'Jakarta Fairship',
            date: '11 Dec',
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 65,
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xffF6F7F8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.home),
            Icon(Icons.message),
            Icon(Icons.chat_bubble_sharp),
            Icon(Icons.logo_dev),
          ],
        ),
      ),
      backgroundColor: AppStyle.whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            _headerContent(),
            _popularCitiesContent(),
            _recommendedContent(),
            _tipsContent()
          ],
        ),
      ),
    );
  }
}
