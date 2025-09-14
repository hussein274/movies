import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/screens/cubit/add_fav_movies_cubit/add_fav_movies_cubit.dart';
import 'package:movies/ui/screens/cubit/add_fav_movies_cubit/add_fav_movies_state.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_text_style.dart';
import 'package:movies/ui/widget/custom_elevated_button.dart';
import '../../generated/assets.dart';
import '../../network/model/response/movies_response/movies_response.dart';
import '../utils/app_routes.dart';
import 'custom_container.dart';

class CustomMoviesDetails extends StatefulWidget {
 final Movie movie;
const CustomMoviesDetails({required this.movie,super.key});

  @override
  State<CustomMoviesDetails> createState() => _CustomMoviesDetailsState();
}

class _CustomMoviesDetailsState extends State<CustomMoviesDetails> {
final FavMoviesCubit _favMoviesCubit=getIt();
bool isSelected=false;

@override

  Widget build(BuildContext context) {


  var height=MediaQuery.of(context).size.height;
  var width=MediaQuery.of(context).size.width;
  return SafeArea(
    child: Scaffold(
      backgroundColor: AppColors.black,
       body: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               height: height*0.75,
               width: width,
               decoration: BoxDecoration(
                   image: DecorationImage(image:
                   NetworkImage(widget.movie.mediumCoverImage??""),fit: BoxFit.contain,),),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     SizedBox(height: 10,),
                     Row(children: [
                       InkWell(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child: Icon(Icons.arrow_back_ios_new,
                           color: AppColors.white,
                           size: 35,
         
                         ),
                       ),
                       Spacer(),
                       BlocBuilder<FavMoviesCubit,AddFavMoviesState>(
                         bloc: _favMoviesCubit,
                           builder: (context, state) {
                           if(state.addFavMovie.isLoading){
                             return CircularProgressIndicator(color: AppColors.yellow,);
         
                           }else if (state.addFavMovie.hasData){
                             return IconButton(onPressed: (){
                               _favMoviesCubit.addToFavourite(widget.movie.id.toString(),
                                   widget.movie.title, widget.movie.rating, widget.movie.mediumCoverImage,
                                   widget.movie.year.toString());
                               setState(() {
                                 isSelected=true;
                               });
                             }, icon:Icon(isSelected?Icons.bookmark:Icons.bookmark,
                             color: isSelected?AppColors.yellow:AppColors.white,
                             size: 35)
                             );
                             }return IconButton(onPressed: (){
                             _favMoviesCubit.addToFavourite(widget.movie.id.toString(),
                                 widget.movie.title, widget.movie.rating, widget.movie.mediumCoverImage,
                                 widget.movie.year.toString());
                             setState(() {
                               isSelected=true;
                             });
                           }, icon:Icon(isSelected?Icons.bookmark:Icons.bookmark,
                               color: isSelected?AppColors.yellow:AppColors.white,
                               size: 50)
                           );
                               }
         
         
         
         
                           ,),
         
         
         
                     ],),
                     SizedBox(height: height*0.17,),
                     InkWell(
                       onTap: () {
                         Navigator.push(context, AppRoutes.moviePlayerScreen(widget.movie));
         
                       },
         
                       child: Center(
                         child: Image.asset(Assets.imagesRunvideo,
         
                         ),
                       ),
                     ),
                     SizedBox(height: height*0.17,),
                     Text(widget.movie.title??"",
                     style: AppTextStyle.roboto27W700
                     ),
                     Text(widget.movie.year.toString()??"",
                     style: AppTextStyle.titleMovieYear),
                    Spacer(),
                     CustomElevatedButton(onPressed: (){},
                       colorButton: Color(0xffE82626),
                       borderColor: Color(0xffE82626),
                       child: InkWell(
                           onTap: () {
                             Navigator.push(context, AppRoutes.moviePlayerScreen(widget.movie));
                           },
                           child: Text("Watch Now",style: AppTextStyle.robotoW700_20)),),
                   ],
                 ),
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomContainer(icon: Assets.imagesHeart, text: widget.movie.rating.toString()??"0"),
                 CustomContainer(icon: Assets.imagesClock, text: widget.movie.runtime.toString()??"0"),
                 CustomContainer(icon: Assets.imagesStar, text: widget.movie.rating.toString()??"0"),
               ],
             ),
             Text(widget.movie.summary,
                 style: AppTextStyle.RobotoW400_20.copyWith(color: AppColors.white)),
           ],
         
         ),
       ),
      ),
  );
  }
}