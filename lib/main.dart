import 'package:animation_course_prebuild/scrollData.dart';
import 'package:flutter/material.dart';

import 'scrollVideoPlayer.dart';
import 'testAnim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ScrollController _scrollController;
  Size? _size;
  double? scrollHeight;
  bool scrolling = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      scrollData.setScrollPos(_scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constraints) {
        _size = MediaQuery.of(context).size;
        scrollData.size = _size!;
        scrollHeight = scrollData.percentageToHeight(2.5);
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                //Animation Component goes in here
                const TestAnimation(),
                const ScrollVideoPlayer(),
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: scrollHeight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
