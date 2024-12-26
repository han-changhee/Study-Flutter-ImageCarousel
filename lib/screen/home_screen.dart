import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(
        Duration(seconds: 3),
        (timer) {
          // print('실행');
          int? nextPage = controller.page?.toInt();

          if (nextPage == null) {
            return;
          }

          if (nextPage == 5) {
            nextPage = 0;
          } else {
            nextPage++;
          }

          controller.animateToPage(
              nextPage,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
          );

        },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5, 6]
            .map(
              (number) =>
              Image.asset(
                'asset/img/image$number.jpeg',
                fit: BoxFit.fill,
              ),
        )
            .toList(),
      ),
    );
  }
}