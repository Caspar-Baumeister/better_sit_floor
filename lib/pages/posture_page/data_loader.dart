import 'package:flutter/material.dart';
import 'package:better_sit_floor/pages/posture_page/posture_page_state.dart';
import 'package:better_sit_floor/provider/posture_provider.dart';
import 'package:provider/provider.dart';

class DataLoader extends StatelessWidget {
  const DataLoader(this.time, {Key? key}) : super(key: key);

  final double time;

  @override
  Widget build(BuildContext context) {
    PostureProvider postureProvider = Provider.of<PostureProvider>(context);

    return postureProvider.initialized
        ? PosturePageManager(time, postureProvider.postures)
        : Container();
  }
}
