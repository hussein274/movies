import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';

import '../../../../generated/assets.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_text_style.dart';
import '../../../widget/custom_elevated_button.dart';

class OnBoarding extends StatefulWidget {
   const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
List<String> onboardingImages = [
  Assets.imagesOnboarding1,
  Assets.imagesOnboarding2,
  // Assets.imagesOnboarding6,
 Assets.imagesOnboarding3,
  Assets.imagesOnboarding4,
  Assets.imagesOnboarding5,
  Assets.imagesOnboarding6,
];

List<String> onboardingTitles1 =[
  "Find Your Next \nFavorite Movie Here",
  "Discover Movies",
  "Explore All Genres",
  "Create Watchlists",
  "Rate, Review, and Learn",
  "Start Watching Now",
];

List<String> onboardingTitles2 =[
  "Get access to a huge library of movies to suit all tastes. You will surely like it.",
  "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
  "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day",
  "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
  "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
  "",
];

int currentIndex = 0;

PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:Stack(
          children: [
            buildPageView(),
            buildOnboardingContainer(),
          ],
        ),
        ),
    );

  }

  buildPageView() {
    return PageView.builder(
      controller:pageController ,
      itemCount: onboardingImages.length,
      onPageChanged: (value) {
        currentIndex=value;
        setState(() {
        });
      },
      itemBuilder: (context, index) {
        return Image.asset(onboardingImages[index],fit: BoxFit.cover,);
      },);
  }

  buildOnboardingContainer() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:currentIndex==0? Colors.transparent : AppColors.black,
          borderRadius:BorderRadius.only(topLeft: Radius.circular(30),
              topRight: Radius.circular(30))

        ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Center(child: Text(onboardingTitles1[currentIndex],style: AppTextStyle.largeText24,textAlign: TextAlign.center,)),
                  Center(child: Text(onboardingTitles2[currentIndex],style: AppTextStyle.mediam,textAlign: TextAlign.center,)),
                  SizedBox(height: 20,),
                  CustomElevatedButton(onPressed: (){
                    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    if(currentIndex==onboardingImages.length-1){
                      Navigator.push(context, AppRoutes.loginScreen);
                    }
                  }, child: Text("Next",style: AppTextStyle.RobotoW400_20)),
                  SizedBox(height: 20,),
                  if(currentIndex>1)
                  CustomElevatedButton(onPressed: (){
                    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },colorButton: AppColors.black, child: Text("Back",
                      style: AppTextStyle.RobotoW400_20.copyWith(color: AppColors.yellow)),),
                ],
              ),
            ),
      ),
    );
  }
}
