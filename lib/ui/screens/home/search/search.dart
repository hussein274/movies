import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/network/model/response/movies_response/movies_response.dart';
import 'package:movies/ui/screens/cubit/movies_cubit/movies_state.dart';
import 'package:movies/ui/screens/cubit/movies_cubit/search_movies.dart';
import 'package:movies/ui/widget/custom_text_form_field.dart';
import '../../../../di/di.dart';
import '../../../../generated/assets.dart';
import '../../../widget/build_movies_item_widget.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
MoviesSearchCubit searchMoviesCubit =getIt<MoviesSearchCubit>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<MoviesSearchCubit>(),
      child: Scaffold(
        body:Column(
          children: [
            Builder(
              builder: (context) {
                return CustomTextFormField(controller:
                TextEditingController(),
                    prefixIcon: Image.asset(Assets.iconsSearch),
                   validator: (value) => null,
                    onChanged: (value) {
                           context.read<MoviesSearchCubit>().searchMovies(value);

                    },
                    hintText: "search");
              }
            ),

            Expanded(
              child: BlocBuilder<MoviesSearchCubit,MoviesState>
                (builder: (context, state) {
                  if(state is MoviesLoading){
                    return const Center(child: CircularProgressIndicator(color: Colors.white,));
                  }else if(state is MoviesError){
                    return Center(child: Text(state.error));
                  }else if(state is MoviesSuccess){
                    return buildHomeScreen(state.movies,context);
                  }
                  return Image.asset(Assets.imagesEmpty) ;

              },),
            )


          ],
        ) ,
      ),
    );
  }

  buildHomeScreen(List<Movie> movies, BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return BuildIMoviestemWidget(movie: movies[index]);
      },
    );
  }
}
