import 'package:flutter/material.dart';
import '../../generated/assets.dart';
import '../../network/model/response/movies_response/movies_response.dart';
import '../utils/app_routes.dart';

class BuildIMoviestemWidget extends StatelessWidget {
  final Movie movie;
  const BuildIMoviestemWidget({required this.movie,super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
           child:
           InkWell(
               onTap: () {
                 Navigator.push(context,
                 AppRoutes.movieDetailsScreen(movie));
               },
               child:

               Image.network(movie.mediumCoverImage,fit: BoxFit.cover,
                 errorBuilder:(context, error, stackTrace) {
                   return Image.asset(Assets.imagesImageCarousel);
                 } ,)),

            ),


        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.rating.toString()??"",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: Colors.yellow, size: 16),
              ],
            ),
          ),
        ),
      ],
    );




  }

}