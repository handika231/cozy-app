import 'package:cozy_app/config/app_style.dart';
import 'package:cozy_app/config/config.dart';
import 'package:cozy_app/model/space/space.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';
  final Space space;
  const DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            space.imageUrl.toString(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 350,
          ),
          Container(
            margin: const EdgeInsets.only(top: 325),
            decoration: BoxDecoration(
              color: AppStyle.whiteColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppStyle.edge,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${space.name}',
                            style: AppStyle.blackTextStyle.copyWith(
                              fontSize: 24,
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
                        ],
                      ),
                      Row(
                        children: [1, 2, 3, 4, 5].map((index) {
                          if (index <= space.rating!.toInt()) {
                            return Icon(
                              Icons.star,
                              color: AppStyle.orangeColor,
                            );
                          } else {
                            return Icon(
                              Icons.star_border,
                              color: AppStyle.orangeColor,
                            );
                          }
                        }).toList(),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppStyle.edge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Main Facilities',
                        style: AppStyle.blackTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityWidget(
                            numbersOfItem: '${space.numberOfKitchens} Kitchen',
                            image: 'kitchen',
                          ),
                          FacilityWidget(
                            numbersOfItem: '${space.numberOfBedrooms} Bedroom',
                            image: 'bedroom',
                          ),
                          FacilityWidget(
                            numbersOfItem:
                                '${space.numberOfCupboards} Big Lemari',
                            image: 'cupboard',
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: AppStyle.edge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Photos',
                        style: AppStyle.blackTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: space.photos?.length,
                          itemBuilder: (context, index) {
                            String? image = space.photos?[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.network(
                                  image!.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: AppStyle.edge,
                    right: AppStyle.edge,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: AppStyle.blackTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${space.address}',
                            style: AppStyle.greyTextStyle,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(
                    horizontal: AppStyle.edge,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      primary: AppStyle.purpleColor,
                      minimumSize: const Size(
                        double.infinity,
                        double.infinity,
                      ),
                    ),
                    child: Text(
                      'Button label',
                      style: AppStyle.whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: AppStyle.edge,
              right: AppStyle.edge,
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/btn_back.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

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
