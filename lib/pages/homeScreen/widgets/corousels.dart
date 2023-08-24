
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CarouselItems extends StatelessWidget {
  const CarouselItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalVariables.greyBackgroundColor,
      margin: const EdgeInsets.only(top: 8),
      child: CarouselSlider.builder(itemCount:GlobalVariables.categoryImages.length,
          itemBuilder: (context, index, realIndex) {
                   return ClipRRect(
                       borderRadius: BorderRadius.circular(25),
                       child: Card(
                           elevation: 12,
                           child: Image.network(GlobalVariables.carouselImages[index],height: 250,fit: BoxFit.fill,)));
          },
          options: CarouselOptions(
            initialPage: 0,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 3)
          )),
    );
  }
}
