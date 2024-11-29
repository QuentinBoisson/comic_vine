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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DetailsTabs(tabs: widget.tabs),
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
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            TabBarView(
              children: [
                Expanded(
                  child: widget.tabs[0],
                ),
                Expanded(
                  child: widget.tabs[1],
                ),
                Expanded(
                  child: widget.tabs[2],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
