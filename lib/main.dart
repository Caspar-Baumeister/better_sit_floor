import 'package:better_sit_floor/preferences/used_poses.dart';
import 'package:flutter/material.dart';
import 'package:better_sit_floor/App.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:better_sit_floor/provider/posture_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UsedPosesPreferences.init();
  await MobileAds.instance.initialize();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PostureProvider()),
  ], child: const App()));
}
