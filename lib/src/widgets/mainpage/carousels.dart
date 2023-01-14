import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mindforcare/src/model/homepage/banner_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Carouselslider extends StatelessWidget {
  const Carouselslider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return Container(
            height: 200,
            margin: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
            padding: const EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () async {
                const url =
                    'https://mindforcare.com/category/blog';
                if (await launchUrlString(url)) {
                await launchUrlString(url);
                } else {
                throw 'Could not launch $url';
                }
              },
              //text inside banner
              child: Stack(
                children: [
                  Image.asset(
                    bannerCards[index].image,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 7, right: 5),
                    alignment: Alignment.topRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollPhysics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
