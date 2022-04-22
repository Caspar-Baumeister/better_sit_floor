import 'package:flutter/material.dart';
import 'package:better_sit_floor/model/posture.dart';
import 'package:better_sit_floor/pages/overview/single_info_page.dart';
import 'package:better_sit_floor/provider/posture_provider.dart';
import 'package:provider/provider.dart';
import 'package:better_sit_floor/shared/constants.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostureProvider postureProvider = Provider.of<PostureProvider>(context);
    return Scaffold(
      backgroundColor: DARK_GREY,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: postureProvider.postures.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7),
                itemBuilder: (BuildContext context, int index) {
                  PostureModel item = postureProvider.getById(index);
                  return OverviewPostureCard(item);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OverviewPostureCard extends StatelessWidget {
  const OverviewPostureCard(this.item, {Key? key}) : super(key: key);

  final PostureModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SinglePosturePage(item)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  item.name,
                  style: SMALLTITLE,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 100),
                child: Image.asset(
                  item.imgUrl,
                  fit: BoxFit.scaleDown,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
