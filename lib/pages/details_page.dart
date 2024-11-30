import 'dart:ui';

import 'package:comic_vine/assets/app_colors.dart';
import 'package:comic_vine/assets/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String? miniaturePath;
  final String backgroundImagePath;
  final List<Widget> titleCardDetails;
  final List<Widget> tabs;

  const DetailsPage({
    super.key,
    required this.title,
    required this.titleCardDetails,
    required this.tabs,
    required this.backgroundImagePath,
    this.miniaturePath,
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
            Image.asset(
              widget.backgroundImagePath,
              width: double.infinity,
              fit: BoxFit.none,
            ),
            Container(
              width: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withOpacity(0.3)),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(
                    top: 75,
                    start: 16,
                    end: 16,
                  ),
                  padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 15,
                  ),
                  child: (widget.miniaturePath != null &&
                          widget.titleCardDetails.length > 0)
                      ? DetailsHeader(
                          miniaturePath: widget.miniaturePath!,
                          titleCardDetails: widget.titleCardDetails,
                        )
                      : null,
                ),
                Positioned.fill(
                  child: DetailsTabs(tabs: widget.tabs),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsHeader extends StatelessWidget {
  final String miniaturePath;
  final List<Widget> titleCardDetails;
  const DetailsHeader({
    super.key,
    required this.miniaturePath,
    required this.titleCardDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Image.asset(
            miniaturePath,
            fit: BoxFit.cover,
            width: 95,
            height: 127,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: titleCardDetails,
        )
      ],
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
            const DetailsTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  DetailsTabContainer(child: widget.tabs[0]),
                  DetailsTabContainer(child: widget.tabs[1]),
                  DetailsTabContainer(child: widget.tabs[2]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsTabContainer extends StatelessWidget {
  final Widget child;
  const DetailsTabContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(20),
        ),
        color: AppColors.screenBackground,
      ),
      child: SingleChildScrollView(child: child),
    );
  }
}

class DetailsTabBar extends StatelessWidget {
  const DetailsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: const TabBar(
        indicator: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.orange, width: 5)),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        dividerHeight: 0,
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
    );
  }
}

class TitleCardDetails extends StatelessWidget {
  final String iconPath;
  final String text;
  const TitleCardDetails({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class Character {
  final String name;
  final String imgPath;
  final List<String>? roles;

  Character({
    required this.name,
    required this.imgPath,
    this.roles,
  });
}

class CharacterListTab extends StatelessWidget {
  final List<Character> characterList;
  const CharacterListTab({
    required this.characterList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...characterList.map(
          (Character character) => CharacterListElement(
            characterName: character.name,
            imagePath: character.imgPath,
            characterRoles: character.roles,
          ),
        )
      ],
    );
  }
}

class CharacterListElement extends StatelessWidget {
  final String imagePath;
  final String characterName;
  final List<String>? characterRoles;
  const CharacterListElement({
    super.key,
    required this.imagePath,
    required this.characterName,
    this.characterRoles,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
              imagePath,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            children: characterRoles != null
                ? [
                    Text(
                      characterName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      characterRoles!.join(', '),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ]
                : [
                    Text(
                      characterName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
          )
        ],
      ),
    );
  }
}

class ExampleDetailsPage extends StatelessWidget {
  const ExampleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailsPage(
      title: "Agents of S.H.I.E.L.D.",
      titleCardDetails: const [
        TitleCardDetails(
          iconPath: AppVectorialImages.icPublisherBicolor,
          text: 'Marvel',
        ),
        TitleCardDetails(
          iconPath: AppVectorialImages.icTvBicolor,
          text: '136 épisodes',
        ),
        TitleCardDetails(
          iconPath: AppVectorialImages.icCalendarBicolor,
          text: '2013',
        ),
      ],
      tabs: [
        const Column(
          children: [
            Text(
              "The missions of the Strategic Homeland Intervention, Enforcement and Logistics Division. A small team of operatives led by Agent Coulson (Clark Gregg) who must deal with the strange new world of \"superheroes\" after the \"Battle of New York\", protecting the public from new and unknown threats.",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 400,
            ),
            Text("Histoire de la série", style: TextStyle(color: Colors.white)),
            Text("Histoire de la série", style: TextStyle(color: Colors.white)),
            Text("Histoire de la série", style: TextStyle(color: Colors.white)),
            Text("Histoire de la série", style: TextStyle(color: Colors.white)),
            Text("Histoire de la série", style: TextStyle(color: Colors.white)),
            Text("Histoire de la série", style: TextStyle(color: Colors.white)),
            Text("Histoire de la série", style: TextStyle(color: Colors.white)),
          ],
        ),
        CharacterListTab(
          characterList: [
            Character(
              name: 'Jemma Simmons',
              imgPath:
                  'https://comicvine.gamespot.com/a/uploads/scale_medium/7/79073/4998056-jemma%20simmons%20%28earth-616%29%20002.jpg',
            ),
            Character(
              name: 'Jemma Simmons',
              imgPath:
                  'https://comicvine.gamespot.com/a/uploads/scale_medium/7/79073/4998056-jemma%20simmons%20%28earth-616%29%20002.jpg',
            ),
            Character(
              name: 'Jemma Simmons',
              imgPath:
                  'https://comicvine.gamespot.com/a/uploads/scale_medium/7/79073/4998056-jemma%20simmons%20%28earth-616%29%20002.jpg',
            ),
            Character(
                name: 'Jemma Simmons',
                imgPath:
                    'https://comicvine.gamespot.com/a/uploads/scale_medium/7/79073/4998056-jemma%20simmons%20%28earth-616%29%20002.jpg',
                roles: ['Auteur', 'Scénariste']),
          ],
        ),
        const Text("Episodes de la série",
            style: TextStyle(color: Colors.white)),
      ],
      backgroundImagePath: AppImages.agentsOfShieldBackground,
      miniaturePath: AppImages.agentsOfShieldMini,
    );
  }
}
