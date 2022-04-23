import 'package:better_sit_floor/shared/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:better_sit_floor/model/posture.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:better_sit_floor/shared/constants.dart';

class SinglePosturePage extends StatefulWidget {
  const SinglePosturePage(
    this.item, {
    Key? key,
  }) : super(key: key);

  final PostureModel item;

  @override
  State<SinglePosturePage> createState() => _SinglePosturePageState();
}

class _SinglePosturePageState extends State<SinglePosturePage> {
  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myBanner.load();
    super.initState();
  }

  final BannerAd myBanner = BannerAd(
    adUnitId: AdHelper(testing: true).bannerAdUnitId,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK_GREY,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  Container(
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
                    child: Image.asset(widget.item.imgUrl, fit: BoxFit.contain),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: Text(
                      widget.item.name,
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
                        ...widget.item.info.map(
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
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
            child: AdWidget(ad: myBanner),
          )
        ],
      ),
    );
  }
}
