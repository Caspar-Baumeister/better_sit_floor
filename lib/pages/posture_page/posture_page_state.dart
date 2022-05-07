import 'dart:async';

import 'package:better_sit_floor/shared/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:better_sit_floor/model/posture.dart';
import 'package:better_sit_floor/pages/posture_page/posture_page.dart';
import 'package:better_sit_floor/shared/constants.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PosturePageManager extends StatefulWidget {
  const PosturePageManager(this.time, this.postures, {Key? key})
      : super(key: key);

  final double time;
  final List<PostureModel> postures;

  @override
  State<PosturePageManager> createState() => _PosturePageManagerState();
}

class _PosturePageManagerState extends State<PosturePageManager> {
  // List<PostureModel> data = [];

  int index = 0;

  late Timer _timer;
  double _start = 0;

  void startTimer() {
    const oneSec = Duration(milliseconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (_start >= widget.time) {
          final player = AudioCache();
          const String alarmAudioPath = "sound.mp3";
          player.play(alarmAudioPath);
          HapticFeedback.vibrate();
          HapticFeedback.heavyImpact();
          setState(() {
            _start = 0;
            setState(() {
              index = (index + 1) % widget.postures.length;
            });
          });
        } else {
          setState(() {
            _start += 0.001;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    myBanner.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myBanner.load();
    startTimer();
    // postureData.forEach((key, value) {
    //   data.add(PostureModel.fromJson(value, key));
    // });
    // data.shuffle();
    super.initState();
  }

  void next() {
    setState(() {
      index = (index + 1) % widget.postures.length;
      _start = 0;
    });
  }

  final BannerAd myBanner = BannerAd(
    adUnitId: AdHelper(testing: false).bannerAdUnitId,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: DARK_GREY,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PosturePage(
                  maxTime: widget.time,
                  currentTime: _start,
                  data: widget.postures[index],
                  next: next,
                ),
              ),
              SizedBox(
                width: myBanner.size.width.toDouble(),
                height: myBanner.size.height.toDouble(),
                child: AdWidget(ad: myBanner),
              )
            ],
          )),
    );
  }
}

class BannerClass extends StatelessWidget {
  const BannerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
