import 'package:animation_course_prebuild/scrollData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:format/format.dart';

class ScrollVideoPlayer extends StatefulWidget {
  const ScrollVideoPlayer({Key? key}) : super(key: key);

  @override
  State<ScrollVideoPlayer> createState() => _ScrollVideoPlayerState();
}

class _ScrollVideoPlayerState extends State<ScrollVideoPlayer>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  List<Image> imgs = <Image>[];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i <= 110; i++) {
      final formatted = format('{:04d}', i);
      imgs.add(Image.asset('imgs/$formatted.png'));
    }

    _ticker = createTicker((elapsed) {
      setState(() {});
    });

    _ticker.start();
  }

  @override
  void didChangeDependencies() {
    for (Image image in imgs) {
      precacheImage(image.image, context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final imgNum = scrollData.scrollPos ~/ 10;

    return Positioned.fill(
        child: IndexedStack(
      index: imgNum,
      children: imgs,
    ));
  }
}
