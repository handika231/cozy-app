import 'package:cozy_app/config/app_style.dart';
import 'package:cozy_app/config/config.dart';
import 'package:cozy_app/model/space/space.dart';
import 'package:cozy_app/pages/home_page.dart';
import 'package:cozy_app/service/url_service.dart';
import 'package:flutter/material.dart';

import '../widgets/facility_widget.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';
  final Space space;
  const DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.network(
            widget.space.imageUrl.toString(),
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
                            '${widget.space.name}',
                            style: AppStyle.blackTextStyle.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text.rich(
                            TextSpan(
                              text: '\$${widget.space.price} ',
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
                          if (index <= widget.space.rating!.toInt()) {
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
                            numbersOfItem:
                                '${widget.space.numberOfKitchens} Kitchen',
                            image: 'kitchen',
                          ),
                          FacilityWidget(
                            numbersOfItem:
                                '${widget.space.numberOfBedrooms} Bedroom',
                            image: 'bedroom',
                          ),
                          FacilityWidget(
                            numbersOfItem:
                                '${widget.space.numberOfCupboards} Big Lemari',
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
                          itemCount: widget.space.photos?.length,
                          itemBuilder: (context, index) {
                            String? image = widget.space.photos?[index];
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
                            '${widget.space.address}',
                            style: AppStyle.greyTextStyle,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          UrlService.launchURL(
                            widget.space.mapUrl.toString(),
                          );
                        },
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
                      'Book Now',
                      style: AppStyle.whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Booking is Success',
                          ),
                        ),
                      );
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.nameRoute, (route) => false);
                    },
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
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: isFavorite
                      ? Image.asset(
                          'assets/btn_wishlist_active.png',
                          width: 40,
                          height: 40,
                        )
                      : Image.asset(
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
