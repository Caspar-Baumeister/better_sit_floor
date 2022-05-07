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
    return SafeArea(
      child: Scaffold(
        backgroundColor: DARK_GREY,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: postureProvider.postures.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, int index) {
                    PostureModel item = postureProvider.getById(index);
                    return OverviewPostureCard(
                        item, postureProvider.isItemUsed(item.id));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OverviewPostureCard extends StatelessWidget {
  const OverviewPostureCard(this.item, this.isUsed, {Key? key})
      : super(key: key);

  final PostureModel item;
  final bool isUsed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SinglePosturePage(item)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: isUsed
                  ? BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 3,
                        color: Colors.green,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    )
                  : BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.red,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
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
        ),
        Positioned(
          right: 9,
          bottom: 9,
          child: GestureDetector(
              onTap: () => Provider.of<PostureProvider>(context, listen: false)
                  .swapItemUsed(item.id),
              child: isUsed
                  ? const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                    )
                  : const Icon(Icons.radio_button_unchecked_rounded,
                      color: Colors.red)),
        )
      ],
    );
  }
}
