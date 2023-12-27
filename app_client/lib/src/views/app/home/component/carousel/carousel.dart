import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:skeletons/skeletons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../constants.dart';
import 'carousel_bloc.dart';

final List<String> imgList = [
  "https://raw.githubusercontent.com/huyennhat-dev/DACN-2/main/banner/IMG_1.jpg",
  "https://raw.githubusercontent.com/huyennhat-dev/DACN-2/main/banner/IMG_2.jpg",
  "https://raw.githubusercontent.com/huyennhat-dev/DACN-2/main/banner/IMG_3.jpg",
  "https://raw.githubusercontent.com/huyennhat-dev/DACN-2/main/banner/IMG_4.jpg",
  "https://raw.githubusercontent.com/huyennhat-dev/DACN-2/main/banner/IMG_5.jpg",
];

class AppCarousel extends StatefulWidget {
  const AppCarousel({super.key});

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  final CarouselBloc _carouselBloc = CarouselBloc();

  @override
  void dispose() {
    _carouselBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: size.width * 0.55,
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlayInterval: const Duration(milliseconds: 7000),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) =>
                  _carouselBloc.changeIndex(index),
            ),
            itemCount: imgList.length,
            itemBuilder: (context, index, realIndex) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  imageUrl: imgList[index],
                  fit: BoxFit.cover,
                  // placeholder: (BuildContext context, String url) =>
                  //     SkeletonParagraph(
                  //   style: SkeletonParagraphStyle(
                  //       lineStyle: SkeletonLineStyle(
                  //     height: size.width * 0.5,
                  //     borderRadius: BorderRadius.circular(7),
                  //     minLength: MediaQuery.of(context).size.width / 2,
                  //   )),
                  // ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: kErrorColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: StreamBuilder<int>(
                stream: _carouselBloc.indexStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return _buildIndicator(imgList.length, snapshot.data ?? 0);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIndicator(count, activateIndex) => AnimatedSmoothIndicator(
        activeIndex: activateIndex,
        count: count,
        effect: const WormEffect(
          dotHeight: 5,
          dotWidth: 15,
          dotColor: Colors.white30,
          activeDotColor: Colors.black54,
        ),
      );
}
