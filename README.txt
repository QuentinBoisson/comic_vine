Explication pour la liste

A des fins de tests, 2 pages ont été crées pour tester les appels à l'API et l'affichage des données correspondantes.

Un fichier dart à été crée spécialement pour gérer les appels à l'API, dans le dossier services, il contient l'url de base de comic vine ainsi que la clé d'API. 
Pour les appels en API pour la liste, le package http est utilisé, c'est une solution très simple qui convient parfaitement aux listes qui ne demande qu'un seul paramètre, et le retour sera un Future (une class Dart qui marche avec les opérations asynchrones)

Nous avons ensuite un fichier qui s'intitule list.dart, c'est une classe qui permet d'afficher les informations de l'API sous format de liste.

Comme dis avant, on utilise un Future pour récupérer les données de l'API et on va d'abord passer par un try qui vérifie quelles données on doit afficher.

Le Widget _buildDetails permet de fabriquer un SizedBox avec dedans des éléments spécifiques au type de liste souhaité.

Le String formatDate à été crée car l'API retourne des formats de date YYYY-mm-dd (année, mois et jour), on remet ces dates dans le format dd-MM-yyyy (jour, mois et année)

Pour la construction de la page, on va utiliser ces éléments :
 - Une AppBar qui se trouvera en haut de la page, le title sera dynamique selon le type de liste choisi.

 - Un Container qui contiendra l'élément le plus important de la page, un ListView.builder, en se basant sur une vidéo Youtube de tutoriel de liste sur Flutter, le choix d'une ListView.builder était le plus judicieux, puisqu'elle sont scrolable, et la scrolabilté est un point important de l'application.

Pour agrémenter la liste, on utilise itemCount afin d'avoir le nombre d'éléments dans la liste, dans ce cas de figure, c'est _items.length (qui sera toujours à 50 vu qu'on met une limite sur l'appel à l'API), et on a un itemBuilder, qui va servir à construire l'élément avec les données de l'API.

Pour cette liste, on à un GestureDetector et un onTap qui renvoie un Navigator.push(), ce n'est juste que pour des tests, il faut que ça soit lié à la page de détails.

Pour l'élément de la liste, on utilise un Card comme child, et celui-ci comporte un Stack avec le numéro de l'élément et l'image de l'élement.

Et pour finir, on à une SizedBox qui comporte le nom de l'élément, une description et une autre SizedBox avec les icones et les données des éléments en question (runtime et année de sortie pour les films par exemple)

Il y'a un petit problème avec l'API pour la requête movies, en appelant "release_date", on se retrouve avec des années qui ne correspondent pas à la véritable année de sortie du film en question.