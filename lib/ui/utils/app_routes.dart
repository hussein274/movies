import 'package:flutter/material.dart';
import 'package:movies/ui/screens/log&reg&for/forget_password_screen.dart';
import 'package:movies/ui/widget/build_video_player_screen.dart';
import '../../network/model/response/movies_response/movies_response.dart';
import '../screens/home/home_tabs.dart';
import '../screens/home/profile_tab/edit_profile.dart';
import '../screens/home/profile_tab/profile.dart';
import '../widget/custom_movie_details.dart';
import '../screens/log&reg&for/login_screen.dart';
import '../screens/log&reg&for/register_screen.dart';
import '../screens/onboarding/onboarding/onboarding.dart';
import '../screens/splach/splash_screen.dart';


abstract class AppRoutes {

  static  Route get splashScreen {return MaterialPageRoute(
      builder: (context) => SplashScreen());}
  static  Route get  onboarding {return MaterialPageRoute(
      builder: (context) => OnBoarding());}
  static  Route get  loginScreen {return MaterialPageRoute(
      builder: (context) => LoginScreen());}

  static  Route get registerScreen{return
  MaterialPageRoute(builder: (context) => RegisterScreen());}

  static  Route get forgetPassScreen {return MaterialPageRoute(
    builder: (context) => ForgetPassScreen(),);}

  static  Route get homeScreen{
    return
  MaterialPageRoute(builder: (context) => Home(),);}

  static Route movieDetailsScreen(Movie movie) {
    return
      MaterialPageRoute(
          builder: (context) => CustomMoviesDetails(movie: movie));}


  static Route editProfileScreen() {
    return MaterialPageRoute(
    builder: (context) => EditProfile(),);}

static Route profileScreen() {
    return MaterialPageRoute(
    builder: (context) => Profile(),);}

  static Route moviePlayerScreen(Movie movie) {
    return MaterialPageRoute(
    builder: (context) => TorrentPlayerPage(torrentUrl: movie.torrents.first.url,),);}
}