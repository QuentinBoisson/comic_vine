import 'package:flutter/material.dart';
import 'package:comic_vine/services/comic_vine_api.dart';
import 'package:comic_vine/pages/page_apres_list.dart';
import 'package:comic_vine/assets/app_colors.dart';
import 'package:comic_vine/assets/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Liste extends StatefulWidget {
  final String type;

  Liste({required this.type});

  @override
  _ListeState createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  List<dynamic> _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    //Check pour afficher la bonne liste
    try {
      if (widget.type == 'Comics') {
        final comics = await ComicVineAPI.fetchComics();
        _items = comics;
      } else if (widget.type == 'Series') {
        final series = await ComicVineAPI.fetchSeries();
        _items = series;
      } else if (widget.type == 'Films') {
        final films = await ComicVineAPI.fetchFilms();
        _items = films;
      }
    } catch (e) {
      print('Erreur lors du chargement des données: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  //Permet de récupérer les bonnes données selon l'appel API
  Widget _buildDetails(dynamic item) {
    if (widget.type == 'Comics') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item['issueNumber'] != null && item['issueNumber'] != 'Numéro inconnu')
            Row(
              children: [
                SvgPicture.asset(AppVectorialImages.icBooksBicolor, width: 18, height: 18),
                const SizedBox(width: 8),
                Text('N° ${item['issueNumber']}', style: TextStyle(color: Colors.white70)),
              ],
            ),

          if (item['date'] != null && item['date'] != 'Date inconnue')
            Row(
              children: [
                SvgPicture.asset(AppVectorialImages.icCalendarBicolor, width: 18, height: 18),
                const SizedBox(width: 8),
                Text('${item['date']}', style: TextStyle(color: Colors.white70)),
              ],
            ),
        ],
      );
    } else if (widget.type == 'Series') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item['publisher'] != null && item['publisher'].isNotEmpty)
            Row(
              children: [
                SvgPicture.asset(AppVectorialImages.icPublisherBicolor, width: 18, height: 18),
                const SizedBox(width: 8),
                Text('${item['publisher']}', style: TextStyle(color: Colors.white70)),
              ],
            ),

          if (item['episodeCount'] != null && item['episodeCount'] != '')
            Row(
              children: [
                SvgPicture.asset(AppVectorialImages.icTvBicolor, width: 18, height: 18),
                const SizedBox(width: 8),
                Text('${item['episodeCount']}', style: TextStyle(color: Colors.white70)),
              ],
            ),

          if (item['startYear'] != null && item['startYear'] != '')
            Row(
              children: [
                SvgPicture.asset(AppVectorialImages.icCalendarBicolor, width: 18, height: 18),
                const SizedBox(width: 8),
                Text('${item['startYear']}', style: TextStyle(color: Colors.white70)),
              ],
            ),
        ],
      );
    } else if (widget.type == 'Films') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (item['runtime'] != null && item['runtime'] != '')
            Row(
              children: [
                SvgPicture.asset(AppVectorialImages.icMovieBicolor, width: 18, height: 18),
                const SizedBox(width: 8),
                Text('${item['runtime']}', style: TextStyle(color: Colors.white70)),
              ],
            ),

          if (item['releaseDate'] != null && item['releaseDate'] != '')
            Row(
              children: [
                SvgPicture.asset(AppVectorialImages.icCalendarBicolor, width: 18, height: 18),
                const SizedBox(width: 8),
                Text('${item['releaseDate']?.split('-')[0]}', style: TextStyle(color: Colors.white70)),
              ],
            ),
        ],
      );
    }

    return SizedBox.shrink();
  }

  //Formattage de date (date de l'api en YYYY-mm-dd)
  String formatDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      var formatter = DateFormat('dd-MM-yyyy');
      return formatter.format(parsedDate);
    } catch (e) {
      print("Erreur de formatage de la date: $e");
      return 'Date invalide';
    }
  }

  // Construction de la page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.screenBackground,
        title: Text(
          '${widget.type} les plus populaires',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: AppColors.screenBackground,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageApresList(
                      title: item['name'] ?? 'Titre indisponible',
                    ),
                  ),
                );
              },
              child: Card(
                color: AppColors.cardBackground,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          if (item['coverUrl'] != null && item['coverUrl'].isNotEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                item['coverUrl'],
                                width: 80,
                                height: 120,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const SizedBox(
                                    width: 80,
                                    height: 120,
                                    child: Center(child: CircularProgressIndicator()),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.broken_image, size: 80, color: Colors.grey);
                                },
                              ),
                            ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '#${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'] ?? 'Nom indisponible',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item['description'] ?? 'Aucune description',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            _buildDetails(item),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
