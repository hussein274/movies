
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/widget/build_movies_item_widget.dart';
import 'package:movies/ui/utils/app_text_style.dart';
import '../../../../generated/assets.dart';
import '../../../../network/model/response/movies_response/movies_response.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../cubit/movies_cubit/movies_cubit.dart';
import '../../cubit/movies_cubit/movies_state.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  MoviesCubit moviesCubit=getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesCubit>()..getMovies(),
      child: Scaffold(
        body: BlocBuilder<MoviesCubit,MoviesState>(
          builder: (context, state) {
            if(state is MoviesLoading){
              return const Center(child: CircularProgressIndicator(color: Colors.white,));
            }else if(state is MoviesError){
              return Center(child: Text(state.error));
            }else if(state is MoviesSuccess){
              return buildHomeScreen(state.movies,context);
            }
            return Container();

        },),
      ),
    );
  }

  buildHomeScreen(List<Movie> movies, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildAvailableMovies(movies: movies,context: context,),
          Column(
            children: [
              Row(children: [Text("Action",style: AppTextStyle.
              RobotoW400_20.copyWith(color: AppColors.white),),Spacer(),
                Text("See More",style: AppTextStyle.smallText.copyWith(color:
                AppColors.yellow)),Icon(Icons.arrow_forward,size: 7,
                  color: AppColors.yellow,),],),
              buildListMovies(movies: movies,)
            ],
          )



        ],
      ),
    );

  }

  buildListMovies({required List<Movie> movies}) {

    return

      SizedBox(
        height: 220,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,

        shrinkWrap: false,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: BuildIMoviestemWidget(movie: movies[index],),
          );
        },
            ),
      );
  }

}

class BuildAvailableMovies extends StatelessWidget {
  final List<Movie> movies;
  final BuildContext context;
  const BuildAvailableMovies({required this.movies,required this.context,super.key});
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     height: MediaQuery.of(context).size.height*0.645.h,
     width: MediaQuery.of(context).size.width,
     child: Stack(
       children: [
         Image.asset(Assets.imagesImageCarousel,
           height: MediaQuery.of(context).size.height*0.645.h,
           width: double.infinity,fit:BoxFit.cover ,),
         ( Container(color: Colors.black.withOpacity(0.5),)),
         Center(child: Image.asset(Assets.imagesTitleCarousel,)),
         Positioned(
           top: 80.h,
           left: 10.w,
           right: 10.w,
           bottom: 90.h,
           child: CarouselSlider(
             items:movies.map((movie) {
               return
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 6),
                   child: InkWell(
                       onTap: () {
                         Navigator.push(context,
                         AppRoutes.movieDetailsScreen(movie));
                       },
                       child: BuildIMoviestemWidget(movie: movie,)),
                 );}).toList(),
             carouselController: CarouselSliderController(),
             options: CarouselOptions(
               autoPlay: false,
               height: 351.h,
               enlargeStrategy: CenterPageEnlargeStrategy.zoom,
               enlargeCenterPage:true,
               viewportFraction: 0.58,
               aspectRatio: 2.0,
               initialPage: 2,
             ),
           ),
         ),


       ],
     ),
   );
  }





}
