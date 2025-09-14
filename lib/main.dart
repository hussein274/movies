import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/di/di.dart';
import 'package:movies/shared_pref_helper/shared_pref_helper.dart';
import 'package:movies/ui/screens/cubit/get_profile_cubit/get_profile_cubit.dart';
import 'package:movies/ui/screens/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:movies/ui/screens/home/home_tabs.dart';
import 'package:movies/ui/screens/splach/splash_screen.dart';
import 'package:movies/ui/utils/app_colors.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   configureDependencies();
   var prefHelper=getIt<SharedPrefHelper>();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>getIt<GetProfileCubit>()..getProfile()),
        BlocProvider(create: (context) => getIt<UpdateProfileCubit>(),)
      ],
      child: MyApp(isLoggedIn: await prefHelper.getToken()!=null,)));
}
class MyApp extends StatelessWidget {
  bool isLoggedIn;

 MyApp({super.key,required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
        builder: (context, child) =>
       MaterialApp(
    theme: ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    canvasColor: AppColors.gray,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
    ),
    ),
    debugShowCheckedModeBanner: false,
    home: isLoggedIn? Home():SplashScreen(),


    )

    );


  }
}
