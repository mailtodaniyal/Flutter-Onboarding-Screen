// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: demo_data.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) => Onboardingcontent(
              image: demo_data[index].image,
              title: demo_data[index].title,
              description: demo_data[index].description,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: 60,
          child: ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 30,
            ),
          ),
        )
      ],
    ));
  }
}

class Content {
  final String image, title, description;

  Content(
      {required this.image, required this.title, required this.description});
}

final List<Content> demo_data = [
  Content(
      image: "assets/3s.png",
      title: "Food Hub by M Daniyal",
      description:
          "I have created my own food restaurant, which has variety of foods"),
  Content(
      image: "assets/5s.png",
      title: "Eat your Favourite Foods here!",
      description: "Get your favourite foods and make your day the best ever."),
  Content(
      image: "assets/2.webp",
      title: "We have Chinese foods also,",
      description:
          "Also get your Chinese foods, you will never miss your appetite"),
  Content(
      image: "assets/4.jpg",
      title: "Order the Food NOW!",
      description:
          "Move on, and order your food. Take your favourite food, and Enjoy your meal!"),
];

class Onboardingcontent extends StatelessWidget {
  const Onboardingcontent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            image,
            height: 250,
          ),
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
