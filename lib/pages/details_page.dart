import 'dart:ui';

import 'package:comic_vine/assets/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String miniaturePath;
  final String backgroundImagePath;
  final List<Widget> titleCardDetails;
  final List<Widget> tabs;

  const DetailsPage({
    super.key,
    required this.title,
    required this.titleCardDetails,
    required this.tabs,
    required this.backgroundImagePath,
    required this.miniaturePath,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.network(
              "https://hdqwalls.com/wallpapers/marvel-agents-of-shield-to.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: const EdgeInsetsDirectional.only(
                  top: 200,
                ),
                child: DetailsTabs(tabs: widget.tabs),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsTabs extends StatefulWidget {
  final List<Widget> tabs;

  const DetailsTabs({
    super.key,
    required this.tabs,
  });

  @override
  State<DetailsTabs> createState() => _DetailsTabsState();
}

class _DetailsTabsState extends State<DetailsTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Expanded(
        child: Column(
          children: [
            Container(
              height: 30,
              color: Colors.black.withOpacity(0.3),
              child: const TabBar(
                indicator: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColors.orange, width: 5)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'Histoire',
                  ),
                  Tab(
                    text: 'Personnages',
                  ),
                  Tab(
                    text: 'Épisodes',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text("Tab1"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text("Tab2"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text("Tab3"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
