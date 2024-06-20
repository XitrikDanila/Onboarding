import 'package:flutter/material.dart';

class UnboardingContent {
  String image;
  String title;
  String discription;
  Color backgroundColor;
  UnboardingContent({
    required this.image,
    required this.title,
    required this.discription,
    required this.backgroundColor,
  });
}

List<UnboardingContent> contentList = [
  UnboardingContent(
    image: 'assets/Img_car1.svg',
    title: "Your first car without a driver's license",
    discription: "Goes to meet people who just got their license",
    backgroundColor: const Color(0xffF0CF69),
  ),
  UnboardingContent(
    image: 'assets/Img_car2.svg',
    title: 'Always there: more than 1000 cars in Tbilisi',
    discription: "Our company is a leader by the number of cars in the fleet",
    backgroundColor: const Color(0xffB7ABFD),
  ),
  UnboardingContent(
    image: 'assets/Img_car3.svg',
    title: 'Do not pay for parking, maintenance and gasoline',
    discription: "We will pay for you, all expenses related to the car",
    backgroundColor: const Color(0xffEFB491),
  ),
  UnboardingContent(
    image: 'assets/Img_car4.svg',
    title: '29 car models: from Skoda Octavia to Porsche 911',
    discription: "Choose between regular car models or exclusive ones",
    backgroundColor: const Color(0xff95B6FF),
  ),
];
