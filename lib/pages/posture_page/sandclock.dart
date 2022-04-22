import 'package:flutter/material.dart';
import 'package:better_sit_floor/shared/constants.dart';

class SandClock extends StatelessWidget {
  const SandClock({Key? key, required this.maxTime, required this.currentTime})
      : super(key: key);

  final double maxTime;
  final double currentTime;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double percent = currentTime / maxTime;
    return Stack(children: [
      Container(
        width: width,
        height: 20,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0x90E8E8E8),
          //     spreadRadius: 5,
          //     blurRadius: 7,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
      ),
      Container(
        //alignment: Alignment.centerLeft,
        width: width * percent,
        height: 20,
        decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
      ),
    ]);
    // return LinearPercentIndicator(
    //   width: MediaQuery.of(context).size.width - 50,
    //   animation: true,
    //   lineHeight: 20.0,
    //   percent: currentTime / maxTime,
    //   progressColor: Colors.green,
    // );
  }
}
