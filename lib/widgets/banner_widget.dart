import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_firebase_app/controllers/banner_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final CarouselController carouselController = CarouselController();
  final BannerController _bannerController = Get.put(BannerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return CarouselSlider(
          items: _bannerController.bannerUrls
              .map((imageUrls) => ClipRect(
                    child: CachedNetworkImage(
                      imageUrl: imageUrls,
                      fit: BoxFit.cover,
                      width: Get.width - 10,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const ColoredBox(
                        color: Colors.white,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            aspectRatio: 2.5,
            viewportFraction: 1,
          ),
        );
      }),
    );
  }
}
