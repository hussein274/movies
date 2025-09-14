import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/network/model/response/get_favourite_movies/get_favorites_movies.dart';
import 'package:movies/ui/screens/cubit/get_profile_cubit/get_profile_cubit.dart';
import 'package:movies/ui/widget/build_movies_item_widget.dart';
import 'package:movies/ui/utils/app_text_style.dart';
import '../../../../di/di.dart';
import '../../../../generated/assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/convert_fav_to_movie.dart';
import '../../cubit/get_fav_movies_cubit/get_fav_movies_cubit.dart';
import '../../cubit/get_fav_movies_cubit/get_fav_movies_state.dart';
import '../../cubit/get_profile_cubit/get_profi_state.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GetProfileCubit getProfileCubit = getIt<GetProfileCubit>();
  final GetFavMoviesCubit getFavMoviesCubit = getIt();

  List<String> avatars = [
    Assets.imagesGamer1,
    Assets.imagesGamer2,
    Assets.imagesGamer3,
    Assets.imagesGamer4,
    Assets.imagesGamer5,
    Assets.imagesGamer6png,
    Assets.imagesGamer7,
    Assets.imagesGamer8,
    Assets.imagesGamer9,
  ];
  int favCount = 0;
  @override
  void initState() {
    super.initState();
    getProfileCubit.getProfile();
    getFavMoviesCubit.getFavMovies();
    getFavMoviesCubit.stream.listen((state) {
      if (state.getFavMovie.hasData) {
        setState(() {
          favCount = state.getFavMovie.getData.data.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Row(
              children: [
                buildProfile(),
                SizedBox(width: 16.w),
                Column(
                  children: [
                    Text(favCount.toString(), style: AppTextStyle.largeText24),
                    Text("History", style: AppTextStyle.RobotoW400_24),
                  ],
                ),
                SizedBox(width: 50.w),
                Column(
                  children: [
                    Text("0", style: AppTextStyle.largeText24),
                    Text("Watchlist", style: AppTextStyle.RobotoW400_24),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                buildEditButton(),
                SizedBox(width: 16.w),
                buildExitButton(),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.yellow,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        SizedBox(
                          height: 80.h,
                          child: Tab(
                            child: Column(
                              children: [
                                Image.asset(Assets.iconsFolder,
                                    height: 42.h, width: 42.w),
                                Text(
                                  "History",
                                  style: AppTextStyle.RobotoW400_20.copyWith(
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                          child: Tab(
                            child: Column(
                              children: [
                                Image.asset(Assets.iconsWatchlist,
                                    height: 42.h, width: 42.w),
                                Text(
                                  "Watchlist",
                                  style: AppTextStyle.RobotoW400_20.copyWith(
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                              padding: EdgeInsets.all(8.0),
                              child: BlocBuilder<GetFavMoviesCubit,
                                  GetFavMoviesState>(
                                bloc: getFavMoviesCubit,
                                builder: (context, state) {
                                  if (state.getFavMovie.isLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator(
                                      color: AppColors.yellow,
                                    ));
                                  }
                                  if (state.getFavMovie.hasData) {
                                    final data = state.getFavMovie.getData;
                                    return buildFavMovies(data);
                                  }
                                  if (state.getFavMovie.isError) {
                                    return Center(
                                        child: Text(state.getFavMovie.error
                                            .toString()));
                                  }
                                  return Center(
                                      child: Image.asset(Assets.imagesEmpty));
                                },
                              )),
                          SingleChildScrollView(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Center(child: Image.asset(Assets.imagesEmpty)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildProfile() {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
      bloc: getProfileCubit,
      builder: (BuildContext context, state) {
        if (state.loginApi.isLoading) {
          return CircularProgressIndicator(color: Colors.white);
        } else if (state.loginApi.isError) {
          return Center(child: Text(state.loginApi.error.toString()));
        } else if (state.loginApi.hasData) {
          final profile = state.loginApi.getData;
          return Column(
            children: [
              Image.asset(
                avatars[profile.data.avaterId ],
                height: 118.h,
                width: 118.w,
              ),
              Text(
                profile.data.name,
                style:
                    AppTextStyle.robotoW700_20.copyWith(color: AppColors.white),
              )
            ],
          );
        } else {
          return Center(child: Text("No Data"));
        }
      },
    );
  }

  buildEditButton() {
    return Expanded(
      flex: 2,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, AppRoutes.editProfileScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        child: Text(
          "Edit Profile",
          style: AppTextStyle.RobotoW400_20.copyWith(color: AppColors.black),
        ),
      ),
    );
  }

  buildExitButton() {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, AppRoutes.loginScreen);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
          backgroundColor: Color(0xffE82626),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
        child: Row(
          children: [
            Center(
              child: Text(
                "Exit",
                style:
                    AppTextStyle.RobotoW400_20.copyWith(color: AppColors.white),
              ),
            ),
            SizedBox(width: 5.w),
            Center(
              child: Icon(Icons.exit_to_app, color: Colors.white, size: 25),
            )
          ],
        ),
      ),
    );
  }

  buildFavMovies(GetAllFavouritesResponse data) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 0.7),
      itemCount: data.data.length,
      itemBuilder: (context, index) {
        final movieFav = data.data[index];
        final movieData = convertFavToMovie(movieFav);
        return BuildIMoviestemWidget(movie: movieData);
      },
    );
  }
}
