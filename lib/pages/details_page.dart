import 'dart:ui';

import 'package:comic_vine/assets/app_colors.dart';
import 'package:comic_vine/assets/resources.dart';
import 'package:comic_vine/models/episode.dart';
import 'package:comic_vine/pages/bloc/author_details_bloc.dart';
import 'package:comic_vine/pages/bloc/character_details_bloc.dart';
import 'package:comic_vine/pages/bloc/comic_book_details_bloc.dart';
import 'package:comic_vine/pages/bloc/episode_list_bloc.dart';
import 'package:comic_vine/pages/bloc/movie_details_bloc.dart';
import 'package:comic_vine/pages/bloc/series_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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
                Expanded(
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

//HEADER
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
          //TODO Implement comics title here
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: titleCardDetails,
        )
      ],
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

//TABS
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
        color: AppColors.cardBackground,
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

//STORY TAB
class StoryTab extends StatelessWidget {
  final String htmlStoryContent;
  const StoryTab({
    super.key,
    required this.htmlStoryContent,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlStoryContent,
      textStyle: const TextStyle(color: Colors.white),
    );
  }
}

//CHARACTER TAB
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
  final List<String> characterIdList;
  final bool isForAuthors;
  const CharacterListTab({
    required this.characterIdList,
    required this.isForAuthors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...characterIdList.map(
          (characterId) => CharacterListElement(characterId: characterId),
        )
      ],
    );
  }
}

class CharacterListElement extends StatelessWidget {
  final String characterId;
  const CharacterListElement({
    super.key,
    required this.characterId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterDetailsBloc(characterId),
      child: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          if (state is CharacterDetailsNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterDetailsNotifierSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      state.character?.iconUrl ?? '',
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(
                    children: [
                      Text(
                        state.character?.name ?? '',
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
          } else if (state is CharacterDetailsNotifierErrorState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Aucune donnée disponible.'));
          }
        },
      ),
    );
  }
}

class AuthorListElement extends StatelessWidget {
  final String authorId;
  const AuthorListElement({
    super.key,
    required this.authorId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorDetailsBloc(authorId),
      child: BlocBuilder<AuthorDetailsBloc, AuthorDetailsState>(
        builder: (context, state) {
          if (state is AuthorDetailsNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthorDetailsNotifierSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      state.author?.iconUrl ?? '',
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(children: [
                    Text(
                      state.author?.name ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      state.author?.role ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ])
                ],
              ),
            );
          } else if (state is AuthorDetailsNotifierErrorState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Aucune donnée disponible.'));
          }
        },
      ),
    );
  }
}

//EPISODES TAB
class EpisodeListTab extends StatelessWidget {
  const EpisodeListTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EpisodeListBloc(
          (BlocProvider.of<SeriesDetailsBloc>(context).state
                      as SeriesDetailsNotifierSuccessState)
                  .series
                  ?.id ??
              ''),
      child: BlocBuilder<EpisodeListBloc, EpisodeListState>(
        builder: (context, state) {
          if (state is EpisodeListNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EpisodeListNotifierSuccessState) {
            return Column(
              children: [
                ...(BlocProvider.of<EpisodeListBloc>(context).state
                        as EpisodeListNotifierSuccessState)
                    .episodeList
                    .map(
                      (Episode episode) => EpisodeListElement(episode: episode),
                    ),
              ],
            );
          } else if (state is EpisodeListNotifierErrorState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Aucune donnée disponible.'));
          }
        },
      ),
    );
  }
}

class EpisodeListElement extends StatefulWidget {
  final Episode episode;
  const EpisodeListElement({super.key, required this.episode});

  @override
  State<EpisodeListElement> createState() => _EpisodeListElementState();
}

class _EpisodeListElementState extends State<EpisodeListElement> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR').then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      decoration: const BoxDecoration(
        color: AppColors.cardElementBackground,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.network(
              widget.episode.imageUrl ?? '',
              fit: BoxFit.cover,
              width: 126,
              height: 105,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Episode #${widget.episode.episodeNumber}",
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.episode.title ?? '???',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  SvgPicture.asset(
                    AppVectorialImages.icCalendarBicolor,
                    width: 14,
                    colorFilter: const ColorFilter.mode(
                        Colors.black12, BlendMode.srcATop),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    widget.episode.releaseDate != null
                        ? DateFormat.yMMMMd("fr_FR")
                            .format(widget.episode.releaseDate!)
                        : '???',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//INFO TAB
class InfoTabElement {
  final String fieldName;
  final List<String> fields;

  InfoTabElement({
    required this.fieldName,
    required this.fields,
  });
}

class InfoListTab extends StatelessWidget {
  final List<InfoTabElement> infoTabElements;
  const InfoListTab({
    super.key,
    required this.infoTabElements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...infoTabElements.map(
          (element) => Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: InfoListElement(infoTabElement: element),
          ),
        ),
      ],
    );
  }
}

class InfoListElement extends StatelessWidget {
  final InfoTabElement infoTabElement;
  const InfoListElement({
    super.key,
    required this.infoTabElement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            infoTabElement.fieldName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...infoTabElement.fields.map(
                (field) => Text(
                  field,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MovieDetailsPage extends StatelessWidget {
  final String movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(movieId),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailsNotifierSuccessState) {
            return DetailsPage(
              title: state.movie?.title ?? '',
              backgroundImagePath: state.movie?.backgroundUrl ?? '',
              titleCardDetails: [
                TitleCardDetails(
                  iconPath: AppVectorialImages.icTvBicolor,
                  text: "${state.movie?.runtime} minutes",
                ),
                TitleCardDetails(
                  iconPath: AppVectorialImages.icCalendarBicolor,
                  text: state.movie?.releaseDate?.toString() ?? '???',
                ),
              ],
              tabs: [
                StoryTab(htmlStoryContent: state.movie?.story ?? ''),
                CharacterListTab(
                  characterIdList: state.movie?.characterIdList ?? [],
                  isForAuthors: false,
                ),
                InfoListTab(infoTabElements: [
                  InfoTabElement(
                      fieldName: 'Classification',
                      fields: [state.movie?.classification ?? '???']),
                  InfoTabElement(
                      fieldName: 'Scénaristes',
                      fields: state.movie?.screenwriters ?? ['???']),
                  InfoTabElement(
                      fieldName: 'Producteurs',
                      fields: state.movie?.producers ?? ['???']),
                  InfoTabElement(
                      fieldName: 'Studios',
                      fields: state.movie?.studios ?? ['???']),
                  InfoTabElement(
                      fieldName: 'Budget',
                      fields: ['${state.movie?.budget} \$']),
                  InfoTabElement(
                      fieldName: 'Recettes au Box Office',
                      fields: ['${state.movie?.boxOfficeRevenue} \$']),
                  InfoTabElement(
                      fieldName: 'Recettes brutes totales',
                      fields: ['${state.movie?.totalRevenue} \$']),
                ]),
              ],
              miniaturePath: state.movie?.thumbnailUrl ?? '',
            );
          } else if (state is MovieDetailsNotifierErrorState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Aucune donnée disponible.'));
          }
        },
      ),
    );
  }
}

class SeriesDetailsPage extends StatelessWidget {
  final String seriesId;
  const SeriesDetailsPage({super.key, required this.seriesId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesDetailsBloc(seriesId),
      child: BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
        builder: (context, state) {
          if (state is SeriesDetailsNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SeriesDetailsNotifierSuccessState) {
            return DetailsPage(
              title: state.series?.title ?? '',
              backgroundImagePath: state.series?.backgroundUrl ?? '',
              titleCardDetails: [
                TitleCardDetails(
                  iconPath: AppVectorialImages.icPublisherBicolor,
                  text: state.series?.publisher ?? '???',
                ),
                TitleCardDetails(
                  iconPath: AppVectorialImages.icTvBicolor,
                  text: "${state.series?.episodeCount} épisodes",
                ),
                TitleCardDetails(
                  iconPath: AppVectorialImages.icCalendarBicolor,
                  text: state.series?.releaseDate?.toString() ?? '???',
                ),
              ],
              tabs: [
                StoryTab(htmlStoryContent: state.series?.story ?? ''),
                CharacterListTab(
                  characterIdList: state.series?.characterIdList ?? [],
                  isForAuthors: false,
                ),
                EpisodeListTab(),
              ],
              miniaturePath: state.series?.thumbnailUrl ?? '',
            );
          } else if (state is SeriesDetailsNotifierErrorState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Aucune donnée disponible.'));
          }
        },
      ),
    );
  }
}

class ComicBookDetailsPage extends StatelessWidget {
  final String comicBookId;
  const ComicBookDetailsPage({super.key, required this.comicBookId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComicBookDetailsBloc(comicBookId),
      child: BlocBuilder<ComicBookDetailsBloc, ComicBookDetailsState>(
        builder: (context, state) {
          if (state is ComicBookDetailsNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ComicBookDetailsNotifierSuccessState) {
            return DetailsPage(
              title: state.comicBook?.issueName ?? '',
              backgroundImagePath: state.comicBook?.backgroundUrl ?? '',
              titleCardDetails: [
                TitleCardDetails(
                  iconPath: AppVectorialImages.icTvBicolor,
                  text: "N°${state.comicBook?.issueNumber}",
                ),
                TitleCardDetails(
                  iconPath: AppVectorialImages.icCalendarBicolor,
                  text: state.comicBook?.releaseDate?.toString() ?? '???',
                ),
              ],
              tabs: [
                StoryTab(htmlStoryContent: state.comicBook?.story ?? ''),
                CharacterListTab(
                  characterIdList: state.comicBook?.authorIdList ?? [],
                  isForAuthors: true,
                ),
                CharacterListTab(
                  characterIdList: state.comicBook?.characterIdList ?? [],
                  isForAuthors: false,
                ),
              ],
              miniaturePath: state.comicBook?.thumbnailUrl ?? '',
            );
          } else if (state is ComicBookDetailsNotifierErrorState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Aucune donnée disponible.'));
          }
        },
      ),
    );
  }
}

class CharacterDetailsPage extends StatelessWidget {
  final String characterId;
  const CharacterDetailsPage({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterDetailsBloc(characterId),
      child: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          if (state is CharacterDetailsNotifierLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterDetailsNotifierSuccessState) {
            return DetailsPage(
              title: state.character?.name ?? '',
              backgroundImagePath: state.character?.backgroundUrl ?? '',
              titleCardDetails: [],
              tabs: [
                StoryTab(htmlStoryContent: state.character?.story ?? ''),
                InfoListTab(infoTabElements: [
                  InfoTabElement(
                      fieldName: 'Nom de super héros',
                      fields: [state.character?.name ?? '???']),
                  InfoTabElement(
                      fieldName: 'Nom réel',
                      fields: [state.character?.realName ?? '???']),
                  InfoTabElement(
                      fieldName: 'Alias',
                      fields: [state.character?.aliases ?? '???']),
                  InfoTabElement(
                      fieldName: 'Editeur',
                      fields: [state.character?.publisher ?? '???']),
                  InfoTabElement(
                      fieldName: 'Créateurs',
                      fields: state.character?.creators ?? ['???']),
                  InfoTabElement(fieldName: 'Genre', fields: [
                    state.character?.gender == 1 ? "Masculin" : 'Feminin'
                  ]),
                  InfoTabElement(fieldName: 'Date de naissance', fields: [
                    state.character?.birthDate?.toString() ?? '???'
                  ]),
                ]),
              ],
            );
          } else if (state is CharacterDetailsNotifierErrorState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Aucune donnée disponible.'));
          }
        },
      ),
    );
  }
}
