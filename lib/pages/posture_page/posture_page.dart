import 'package:flutter/material.dart';
import 'package:better_sit_floor/model/posture.dart';
import 'package:better_sit_floor/pages/posture_page/sandclock.dart';

class PosturePage extends StatelessWidget {
  const PosturePage(
      {Key? key,
      required this.data,
      required this.next,
      required this.maxTime,
      required this.currentTime})
      : super(key: key);

  final PostureModel data;
  final VoidCallback next;
  final double maxTime;
  final double currentTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(14).copyWith(bottom: 6),
          alignment: Alignment.centerLeft,
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        GestureDetector(
          onTap: () => next(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Image.asset(data.imgUrl, fit: BoxFit.contain),
          ),
        ),
        SandClock(maxTime: maxTime, currentTime: currentTime),
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            data.name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 34),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: const Text("Tips:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
        Container(
            padding: const EdgeInsets.all(20).copyWith(top: 10),
            child: Column(
              children: [
                ...data.info.map(
                  (String info) => Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          info,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
