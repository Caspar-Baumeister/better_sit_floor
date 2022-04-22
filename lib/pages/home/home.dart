import 'package:flutter/material.dart';
import 'package:better_sit_floor/pages/info_pages/info_page.dart';
import 'package:better_sit_floor/pages/overview/overview.dart';
import 'package:better_sit_floor/pages/posture_page/data_loader.dart';
import 'package:better_sit_floor/shared/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double time = 300; // time in seconds

  changeTime(double newTime) {
    final rest = newTime % 5;
    setState(() {
      time = newTime - rest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK_GREY,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.zoom_in,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Overview()),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  child: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InfoPage()),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Clock(time),
                const SizedBox(height: 20),
                Slider(
                  activeColor: PRIMARY_COLOR,
                  inactiveColor: LIGHT_GREY,
                  thumbColor: WHITE,
                  value: time,
                  onChanged: changeTime,
                  max: 1800,
                  min: 10,
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataLoader(time)),
                    );
                  },
                  child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "START",
                        style: TextStyle(color: WHITE, fontSize: 26),
                      )),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class Clock extends StatelessWidget {
  const Clock(this.time, {Key? key}) : super(key: key);

  final double time;

  @override
  Widget build(BuildContext context) {
    int minutes = time ~/ 60;
    double seconds = time % 60;
    return Container(
      alignment: Alignment.center,
      child: Text(
        minutes.toString().padLeft(2, '0') +
            ":" +
            seconds.toStringAsFixed(0).padLeft(2, '0'),
        style: TextStyle(color: WHITE, fontSize: 56),
      ),
    );
  }
}
