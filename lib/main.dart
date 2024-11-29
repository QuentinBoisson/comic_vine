import 'package:comic_vine/assets/resources.dart';
import 'package:comic_vine/pages/details_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DetailsPage(
        title: "Agents of S.H.I.E.L.D.",
        titleCardDetails: [
          Text("Marvel"),
          Text("136 épisodes"),
          Text("2013"),
        ],
        tabs: [
          Text("Histoire de la série"),
          Text("Personnages de la série"),
          Text("Episodes de la série"),
        ],
        backgroundImagePath: AppImages.agentsOfShieldBackground,
        miniaturePath: AppImages.agentsOfShieldMini,
      ),
    );
  }
}
